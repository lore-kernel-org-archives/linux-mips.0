Subject: Re: bug in memscan()
In-Reply-To: <20011024182744T.machida@sm.sony.co.jp>
References: <20011024182744T.machida@sm.sony.co.jp>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <20011025122504L.machida@sm.sony.co.jp>
Date: Thu, 25 Oct 2001 12:25:04 +0900
From: Machida Hiroyuki <machida@sm.sony.co.jp>
Sender: owner-linux-mips@oss.sgi.com
To: ralf@oss.sgi.com
Cc: linux-mips@oss.sgi.com, takemura@sm.sony.co.jp, shin@sm.sony.co.jp
Message-ID: <20011025032504.MrHbkUgKS_w8B9ZVgAkzVfWyrL44qilYF-TeQ9Uli2o@z>


Actually, we have a problem with japanese usb keyboard caused by
this bug. Japanese usb keyboard generates scan codes which have
MSB-on. 

From: Machida Hiroyuki <machida@sm.sony.co.jp>
Subject: bug in memscan()
Date: Wed, 24 Oct 2001 18:27:44 +0900

> Memscan() must compare a given 2nd parameter with memory by using 
> unsinged char, as memchr() do. But, memscan() in
> include/asm-mips/string.h and lib/string.c don't so. 
> 
> Please refer memchr() in sysdeps/generic/memchr.c of glic and 
> lib/string.c.

Previous my patch for include/asm/string.h is not good.
Please try this.

Index: string.h
===================================================================
RCS file: /cvs/linux/include/asm-mips/string.h,v
retrieving revision 1.18
diff -u -p -r1.18 string.h
--- string.h	2001/10/06 19:29:25	1.18
+++ string.h	2001/10/25 03:14:19
@@ -136,17 +136,18 @@ extern void *memmove(void *__dest, __con
 extern __inline__ void *memscan(void *__addr, int __c, size_t __size)
 {
 	char *__end = (char *)__addr + __size;
+	unsigned char * __uc = (unsigned char) __c;
 
 	__asm__(".set\tpush\n\t"
 		".set\tnoat\n\t"
 		".set\treorder\n\t"
 		"1:\tbeq\t%0,%1,2f\n\t"
 		"addiu\t%0,1\n\t"
-		"lb\t$1,-1(%0)\n\t"
+		"lbu\t$1,-1(%0)\n\t"
 		"bne\t$1,%z4,1b\n"
 		"2:\t.set\tpop"
 		: "=r" (__addr), "=r" (__end)
-		: "0" (__addr), "1" (__end), "Jr" (__c));
+		: "0" (__addr), "1" (__end), "Jr" (__uc));
 
 	return __addr;
 }
Index: lib/string.c
===================================================================
RCS file: /cvs/linux/lib/string.c,v
retrieving revision 1.13
diff -u -p -r1.13 string.c
--- lib/string.c	2001/06/13 17:28:17	1.13
+++ lib/string.c	2001/10/24 09:17:05
@@ -477,7 +477,7 @@ void * memscan(void * addr, int c, size_
 	unsigned char * e = p + size;
 
 	while (p != e) {
-		if (*p == c)
+		if (*p == (unsigned char)c)
 			return (void *) p;
 		p++;
 	}
