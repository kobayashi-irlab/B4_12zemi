# ===== Engine & options =====
$lualatex = 'lualatex -synctex=1 -interaction=nonstopmode -file-line-error -halt-on-error --shell-escape %O %S';
$biber    = 'biber --bblencoding=utf8 -u -U --output_safechars %O %S';
$makeindex = 'makeindex %O -o %D %S';
$ENV{TEXINPUTS} = 'styles//:' . $ENV{TEXINPUTS};
$pdf_mode = 1;

# ===== Where to put outputs =====
if (-f "build flag"){
  $out_dir = 'build';
  $aux_dir = 'build';
}