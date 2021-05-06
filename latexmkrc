@default_files = ('main', 'supplement');
$pdflatex = 'pdflatex -halt-on-error %O %S';
$pdf_mode = 1;

# Cleanup temporary files
push @generated_exts, 'glo', 'gls', 'glg';
push @generated_exts, 'acn', 'acr', 'alg';
push @generated_exts, 'nav', 'run.xml', 'tdo', 'snm', 'eps-converted-to.pdf';
$clean_ext = 'bbl glo gls run.xml upa upb xdy ist tdo';

