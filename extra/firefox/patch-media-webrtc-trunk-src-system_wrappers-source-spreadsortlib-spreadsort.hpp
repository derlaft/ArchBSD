--- media/webrtc/trunk/src/system_wrappers/source/spreadsortlib/spreadsort.hpp.orig	2013-02-12 22:03:27.000000000 +0100
+++ media/webrtc/trunk/src/system_wrappers/source/spreadsortlib/spreadsort.hpp	2013-02-12 22:03:58.000000000 +0100
@@ -21,6 +21,13 @@ Scott McMurray
 #include "constants.hpp"
 #include <cstring>
 
+#ifdef __FreeBSD__
+# include <osreldate.h>
+# if __FreeBSD_version < 900506
+#  define getchar boost_getchar
+# endif
+#endif
+
 namespace boost {
   namespace detail {
   	//This only works on unsigned data types
