:: ----------------------------------------------------------- Branch / Tag ----
%svnExePath% mkdir -m "Livraison %next3pVers%" %remoteRoot%/%remoteFold%/tags/%dateIsoStr%_livraison_%next3pVers%
%svnExePath% copy %remoteRoot%/%remoteFold%/dev             %remoteRoot%/%remoteFold%/tags/%dateIsoStr%_livraison_%next3pVers% -m "Livraison %next3pVers% / tag dev"
%svnExePath% copy %remoteRoot%/%remoteFold%/translate       %remoteRoot%/%remoteFold%/tags/%dateIsoStr%_livraison_%next3pVers% -m "Livraison %next3pVers% / tag transalte"
%svnExePath% copy %remoteRoot%/%remoteFold%/ressources      %remoteRoot%/%remoteFold%/tags/%dateIsoStr%_livraison_%next3pVers% -m "Livraison %next3pVers% / tag ressources"
%svnExePath% copy %remoteRoot%/%remoteFold%/deploy_template %remoteRoot%/%remoteFold%/tags/%dateIsoStr%_livraison_%next3pVers% -m "Livraison %next3pVers% / tag deploy_template"
