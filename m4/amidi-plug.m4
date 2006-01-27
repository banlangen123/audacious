# Checks for amidi-plug

dnl AM_PATH_AMIDIPLUG([ACTION-IF-FOUND , ACTION-IF-NOT-FOUND])
dnl Test for AMIDI-Plug and ALSA-supported hardware synth
dnl
AC_DEFUN([AM_PATH_AMIDIPLUG],
[

AMIDIPLUG_EVERYTHINGOK="yes"

dnl **** Check for ALSA ****
PKG_CHECK_MODULES(ALSA, [alsa >= 0.9.0],
  [ap_alsa_found=yes], [ap_alsa_found=no])

if test "x$ap_alsa_found" = "xyes"; then
  dnl **** Search for a hardware synth (ALSA managed)  ****
  AC_CHECK_FILE([/proc/asound/card0/wavetableD1],
    [ap_hwsynth_found=yes], [ap_hwsynth_found=no])
  if test "x$ap_hwsynth_found" = "xno"; then
    AC_CHECK_FILE([/proc/asound/card1/wavetableD1],
      [ap_hwsynth_found=yes], [ap_hwsynth_found=no])
    if test "x$ap_hwsynth_found" = "xno"; then
      AC_CHECK_FILE([/proc/asound/card2/wavetableD1],
        [ap_hwsynth_found=yes], [ap_hwsynth_found=no])
      if test "x$ap_hwsynth_found" = "xno"; then
        AMIDIPLUG_EVERYTHINGOK="no"
        AC_MSG_WARN([*** Could not find an ALSA-supported hardware synth, amidi-plug won't be compiled. If you wish to compile it anyway, use --enable-amidiplug in configure. ***])
      fi
    fi
  fi
else
  AMIDIPLUG_EVERYTHINGOK="no"
fi

if test "x$AMIDIPLUG_EVERYTHINGOK" = "xyes"; then
  ifelse([$1], , :, [$1])
else
  ifelse([$2], , :, [$2])
fi

])
