Message-ID: <3A5DD6A8.1040600@Lineo.COM>
Date: Thu, 11 Jan 2001 08:52:08 -0700
From: Quinn Jensen <jensenq@Lineo.COM>
MIME-Version: 1.0
Subject: Re: [BusyBox] 0.48 - Can't mount /proc
References: <3A5CAC53.60700@jungo.com> <20010110122159.A24714@lineo.com> <3A5D609C.2080201@jungo.com> <20010111044808.A1592@lineo.com> <20010111130450.B5811@paradigm.rfc822.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: owner-linux-mips@oss.sgi.com
Cc: Erik Andersen <andersen@lineo.com>, Michael Shmulevich <michaels@jungo.com>, busybox@opensource.lineo.com
Message-ID: <20010111155208.C7NhGpRUi5Iw8YHu90BMSg2AE6j3HLSxR4N1ggKF8d8@z>

Here's a kernel patch.  The __access_ok macro looks one byte
too far and fails.  Since copy_mount_options() isn't
sure how long the string arguments are, it just copies
to the end of the page.  Since this is on busybox's
stack, the copy wants to go all the way to 0x7FFFFFF
and hits this corner case.

Quinn Jensen
jensenq@lineo.com


--- linux-sgi-2.4.0-test11-pristine/include/asm-mips/uaccess.h  Wed Oct  4 19:19:02 2000
+++ linux/include/asm-mips/uaccess.h    Wed Jan 10 16:20:35 2001
@@ -46,7 +46,7 @@
   *  - OR we are in kernel mode.
   */
  #define __access_ok(addr,size,mask) \
-        (((__signed__ long)((mask)&(addr | size | (addr+size)))) >= 0)
+        (((__signed__ long)((mask)&(addr | size | (addr+size-1)))) >= 0)
  #define __access_mask ((long)(get_fs().seg))

  #define access_ok(type,addr,size) \ 
