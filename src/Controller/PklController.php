<?php

namespace Drupal\module_pkl\Controller;

use Drupal\Core\Controller\ControllerBase;
use Symfony\Component\HttpFoundation\Response;

/**
 * Controller for PKL module.
 */
class PklController extends ControllerBase {

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
    return [
      '#markup' => $this->t('Nama-Nama Perusahaan Tempat PKL Angkatan @angkatan', ['@angkatan' => $angkatan]),
      '#cache' => [
        'max-age' => 0,
      ],
    ];
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
    return [
      '#markup' => $this->t('Nama-nama murid angkatan @angkatan yang PKL di Perusahaan @perusahaan', [
        '@angkatan' => $angkatan,
        '@perusahaan' => $perusahaan,
      ]),
      '#cache' => [
        'max-age' => 0,
      ],
    ];
  }

}
