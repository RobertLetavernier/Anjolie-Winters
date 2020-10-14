:: ----------------------------------------------------------- Branch / Tag ----
%svnExePath% mkdir -m "Livraison %next3pVers%" %sourceRoot%/%remoteFold%/tags/%dateIsoStr%_livraison_%next3pVers%
%svnExePath% copy %sourceRoot%/%remoteFold%/dev             %sourceRoot%/%remoteFold%/tags/%dateIsoStr%_livraison_%next3pVers% -m "Livraison %next3pVers% / tag dev"
%svnExePath% copy %sourceRoot%/%remoteFold%/translate       %sourceRoot%/%remoteFold%/tags/%dateIsoStr%_livraison_%next3pVers% -m "Livraison %next3pVers% / tag transalte"
%svnExePath% copy %sourceRoot%/%remoteFold%/ressources      %sourceRoot%/%remoteFold%/tags/%dateIsoStr%_livraison_%next3pVers% -m "Livraison %next3pVers% / tag ressources"
%svnExePath% copy %sourceRoot%/%remoteFold%/deploy_template %sourceRoot%/%remoteFold%/tags/%dateIsoStr%_livraison_%next3pVers% -m "Livraison %next3pVers% / tag deploy_template"
