<?php

require 'vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

// new book and sheet
$spreadsheet = new Spreadsheet();
$sheet = $spreadsheet->getActiveSheet();

// set value
$sheet->setCellValue('A1', 'Setting a simple value');

// save to file
$writer = new Xlsx($spreadsheet);
$writer->save('hello world.xlsx');

