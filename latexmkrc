@default_files = ('supplement', 'main');
$pdflatex = 'pdflatex -halt-on-error %O %S';
$pdf_mode = 1;

# Cleanup temporary files
push @generated_exts, 'glo', 'gls', 'glg';
push @generated_exts, 'acn', 'acr', 'alg';
push @generated_exts, 'nav', 'run.xml', 'tdo', 'snm', 'eps-converted-to.pdf';
$clean_ext = 'bbl glo gls run.xml upa upb xdy ist tdo';

# To get the cross-references right on overleaf
add_cus_dep( 'tex', 'aux', 0, 'makeexternaldocument' );

sub makeexternaldocument {
    if (!($root_filename eq $_[0]))
    {
        system( "latexmk -cd -pdf \"$_[0]\"" );
    }
}
