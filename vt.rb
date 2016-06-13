require 'formula'

class Vt < Formula
  homepage 'https://github.com/atks/vt'
  version '2016-06-02'
  url "https://github.com/atks/vt/archive/39f8680.tar.gz"
  sha256 "d66a5377b33e62a37bad904e7ada6e292cc14abd0592086c232436f9511500cc"

  patch <<-'patch_isnan'
diff -c a/paste_and_compute_features_sequential.cpp b/paste_and_compute_features_sequential.cpp
*** a/paste_and_compute_features_sequential.cpp	2016-06-01 23:04:57.000000000 -0400
--- b/paste_and_compute_features_sequential.cpp	2016-06-13 15:33:43.232266859 -0400
***************
*** 696,702 ****
  	  float fic = 0;
  	  n = 0;
  	  est->compute_gl_fic(v_pls[k], nfiles, ploidy, MLE_HWE_AF, vn_alleles[k], MLE_GF, fic, n);
! 	  if ( isnan((double)fic) ) fic = 0;	  
  	  if (n) {
  	    bcf_update_info_float(odw->hdr, nv, "IBC", &fic, 1);
  	  }
--- 696,702 ----
  	  float fic = 0;
  	  n = 0;
  	  est->compute_gl_fic(v_pls[k], nfiles, ploidy, MLE_HWE_AF, vn_alleles[k], MLE_GF, fic, n);
! 	  if ( std::isnan((double)fic) ) fic = 0;	  
  	  if (n) {
  	    bcf_update_info_float(odw->hdr, nv, "IBC", &fic, 1);
  	  }
diff -c a/paste_genotypes.cpp b/paste_genotypes.cpp
*** a/paste_genotypes.cpp	2016-06-01 23:04:57.000000000 -0400
--- b/paste_genotypes.cpp	2016-06-13 15:33:31.460266869 -0400
***************
*** 726,732 ****
  	  float fic = 0;
  	  n = 0;
  	  est->compute_gl_fic(v_pls[k], nfiles, ploidy, MLE_HWE_AF, vn_alleles[k], MLE_GF, fic, n);
! 	  if ( isnan((double)fic) ) fic = 0;	  
  	  if (n) {
  	    bcf_update_info_float(odw->hdr, nv, "IBC", &fic, 1);
  	  }
--- 726,732 ----
  	  float fic = 0;
  	  n = 0;
  	  est->compute_gl_fic(v_pls[k], nfiles, ploidy, MLE_HWE_AF, vn_alleles[k], MLE_GF, fic, n);
! 	  if ( std::isnan((double)fic) ) fic = 0;	  
  	  if (n) {
  	    bcf_update_info_float(odw->hdr, nv, "IBC", &fic, 1);
  	  }
  patch_isnan

  def install
    system 'make'
    bin.install 'vt'
  end

  test do
    system 'vt'
  end
end
