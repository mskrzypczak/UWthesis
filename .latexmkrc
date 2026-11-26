
$pdf_mode = 1;                       # build PDFs
$interaction = 'nonstopmode';
$pdflatex = 'pdflatex -file-line-error -interaction=nonstopmode -halt-on-error -shell-escape %O %S';
$bibtex = 'bibtex %O %B';
$aux_dir = '_build';
$out_dir = 'dist';
ensure_path('BIBINPUTS', 'examples');  # the examples keep their .bib next to them

