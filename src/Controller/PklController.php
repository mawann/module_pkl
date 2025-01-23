<?php

namespace Drupal\module_pkl\Controller;

use Drupal\Core\Controller\ControllerBase;
use Drupal\Core\Database\Connection;
use Drupal\Core\Url;
use Symfony\Component\DependencyInjection\ContainerInterface;

/**
 * Controller for PKL module.
 */
class PklController extends ControllerBase {

  /**
   * The database connection.
   *
   * @var \Drupal\Core\Database\Connection
   */
  protected $database;

  /**
   * Constructs a PklController object.
   *
   * @param \Drupal\Core\Database\Connection $database
   *   The database connection.
   */
  public function __construct(Connection $database) {
    $this->database = $database;
  }

  /**
   * {@inheritdoc}
   */
  public static function create(ContainerInterface $container) {
    return new static(
      $container->get('database')
    );
  }

  /**
   * Display PKL data for specific angkatan.
   *
   * @param int $angkatan
   *   The angkatan year.
   *
   * @return array
   *   Render array for the page.
   */
  public function angkatanPage($angkatan) {
    try {
      // Query to get companies and count of students
      $query = $this->database->select('pkl_perusahaan', 'p');
      $query->fields('p', ['id', 'nama']);
      $query->addExpression('COUNT(m.id)', 'jumlah_murid');
      $query->leftJoin('pkl_murid', 'm', 'p.angkatan = m.angkatan AND p.id = m.id_perusahaan');
      $query->condition('p.angkatan', $angkatan);
      $query->groupBy('p.id');
      $query->groupBy('p.nama');
      $query->orderBy('p.nama', 'ASC');
      
      $results = $query->execute()->fetchAll();

      // Build table header
      $header = [
        ['data' => $this->t('No.'), 'class' => ['nomor-column']],
        ['data' => $this->t('Nama Perusahaan'), 'class' => ['nama-column']],
        ['data' => $this->t('Jumlah Murid'), 'class' => ['jumlah-column']],
      ];

      // Build table rows
      $rows = [];
      $nomor = 1;

      foreach ($results as $row) {
        // Create URL for student count link
        $url = Url::fromRoute('module_pkl.angkatan_perusahaan', [
          'angkatan' => $angkatan,
          'perusahaan' => $row->id,
        ]);

        $rows[] = [
          'no' => ['data' => $nomor++, 'class' => ['nomor-column']],
          'nama' => ['data' => $row->nama, 'class' => ['nama-column']],
          'jumlah' => [
            'data' => [
              '#type' => 'link',
              '#title' => $row->jumlah_murid,
              '#url' => $url,
            ],
            'class' => ['jumlah-column'],
          ],
        ];
      }

      // Return the render array with table
      return [
        '#type' => 'container',
        'title' => [
          '#type' => 'html_tag',
          '#tag' => 'p',
          '#value' => $this->t('Berikut ini adalah nama-nama perusahaan tempat PKL murid-murid DKV angkatan @angkatan', ['@angkatan' => $angkatan]),
        ],
        'table' => [
          '#theme' => 'table',
          '#header' => $header,
          '#rows' => $rows,
          '#empty' => $this->t('Tidak ada data perusahaan untuk angkatan ini.'),
          '#attributes' => ['class' => ['pkl-perusahaan-table']],
        ],
        '#attached' => [
          'library' => ['module_pkl/pkl-styles'],
        ],
        '#cache' => [
          'max-age' => 0,
        ],
      ];
    }
    catch (\Exception $e) {
      \Drupal::messenger()->addError($this->t('Terjadi kesalahan saat mengambil data.'));
      return [
        '#markup' => $this->t('Terjadi kesalahan saat mengambil data.'),
      ];
    }
  }

  /**
   * Display PKL data for specific angkatan and perusahaan.
   *
   * @param int $angkatan
   *   The angkatan year.
   * @param int $perusahaan
   *   The perusahaan ID.
   *
   * @return array
   *   Render array for the page.
   */
  public function perusahaanPage($angkatan, $perusahaan) {
    // Get the company name first
    $company_query = $this->database->select('pkl_perusahaan', 'p')
      ->fields('p', ['nama'])
      ->condition('p.angkatan', $angkatan)
      ->condition('p.id', $perusahaan);
    $company_name = $company_query->execute()->fetchField();

    // Query to get students for this company
    $query = $this->database->select('pkl_murid', 'm');
    $query->fields('m', ['nama', 'kelas']);
    $query->condition('m.angkatan', $angkatan);
    $query->condition('m.id_perusahaan', $perusahaan);
    $query->orderBy('m.nama', 'ASC');
    
    $results = $query->execute();

    // Build table header
    $header = [
      ['data' => $this->t('No.'), 'class' => ['nomor-column']],
      ['data' => $this->t('Nama'), 'class' => ['nama-column']],
      ['data' => $this->t('Kelas'), 'class' => ['kelas-column']],
    ];

    // Build table rows
    $rows = [];
    $nomor = 1;

    foreach ($results as $row) {
      $rows[] = [
        ['data' => $nomor++, 'class' => ['nomor-column']],
        ['data' => $row->nama, 'class' => ['nama-column']],
        ['data' => $row->kelas, 'class' => ['kelas-column']],
      ];
    }

    // Return the render array with table
    return [
      '#type' => 'container',
      'title' => [
        '#type' => 'html_tag',
        '#tag' => 'p',
        '#value' => $this->t('Berikut ini adalah nama-nama murid yang melakukan PKL di @company (Angkatan @angkatan)', [
          '@company' => $company_name,
          '@angkatan' => $angkatan,
        ]),
      ],
      'table' => [
        '#theme' => 'table',
        '#header' => $header,
        '#rows' => $rows,
        '#empty' => $this->t('Tidak ada murid yang PKL di perusahaan ini.'),
        '#attributes' => ['class' => ['pkl-murid-table']],
        '#attached' => [
          'library' => ['module_pkl/pkl-styles'],
        ],
      ],
      '#cache' => [
        'max-age' => 0,
      ],
    ];
  }
}
