From: anthony.wei@philips.com
Subject: Has anyone successfully reduced the size of libc.so?
Message-ID: <0056910011804600000002L102*@MHS>
Date: Thu, 3 May 2001 12:19:21 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; name="MEMO 05/03/01 12:16:08"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com, linux-mips@fnet.fr
Cc: brad@ltc.com
Message-ID: <20010503171921.oV4Gk6rkq3RYSAmGkqLj3geZrIlDjsc7jEuC2s9BRWE@z>

Hi,

I am trying to create a stripped version of  libc.so  from glibc.2.1.95 src, by including only minimal symbols.
	original full size libc.so: 				7.9 Meg
 	original libc.so but symbols stripped 		1.7 Meg
	(running mipsel-linux-strip libc.so)

Has anyone successfully  reduced the size of the libc.so?

Here is what I did.  I started with glibc 2.1.95 and cross compiled for MIPS.

	A.  Using Bradley D. LaRonde's ramdisk as a model
	B.  Ran strings on /lib/libc-2.0.7.so and /lib/ld-2.0.7.so on LaRonde's ramdisk
	 	Removed  all the messages, leaving mostly  symbols.
	C.  Ran a script, that took the symbols and found the corresponding
		*.os file.  And resolved rescursively all undefined symbols.
	D.  Extracted the commands used to create libc.so & ld.so, from
		the log while cross compiling glibc.  Theses included:
			dl-allobjs.os		libc_pic.a
			librtld.os		ld.so
			libc_pic.os		libc.so
	E.  Replaced */stamp.os with the files found from step C.
	F.  Extracted the symbols required for the ls command., and added to the *.os list.  
		This brought the size of the libc.so back to the original size 1.7Meg (stripped)).
	


Thanks.

Anthony Wei
Philips Digital Network
1000 West Maude Avenue     W3-948
Sunnyvale, CA 94085-2810
+1-408-617-1673
