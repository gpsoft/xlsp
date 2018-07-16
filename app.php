<?php

require 'vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

// new book and sheet
$spreadsheet = new Spreadsheet();
$sheet = $spreadsheet->getActiveSheet();

// hide grid lines
$sheet->setShowGridLines(false);

// set value
$sheet->setCellValue('A1', 'Setting a simple value');
$sheet->setCellValue('B1', 'This is B1');
$sheet->setCellValue('A2', 'A2');
$sheet->setCellValue('B2', 'B2');

// save to files
$writer = new Xlsx($spreadsheet);
$writer->save('hello world.xlsx');
$writer = \PhpOffice\PhpSpreadsheet\IOFactory::createWriter($spreadsheet, 'Dompdf');
$writer->save('hello world.pdf');

