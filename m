content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: Error in loading shared library glinc-2.0.6.so.
Date: Mon, 24 Sep 2001 18:10:07 -0700
Message-ID: <84CE342693F11946B9F54B18C1AB837B14A1A4@ex2k.pcs.psdc.com>
From: "Steven Liu" <stevenliu@psdc.com>
Content-Transfer-Encoding: 8bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20010925011007.nrYzYEpQptds4n_Vkwn8wUqsAqRu9yvOQ0nCbzD1d6A@z>

Hi, All:

I have a bootupproblem in my new Mips R3000 Linux system. 

I build the kernel 2.2.12, glibc-2.0.6, gcc and init utility. When it
boots up, it loads /sbin/init, /lib/ld-2.0.6.so,and /etc/ld.so.cache.
But it gives an error when it tries to load /lib/libc-2.0.6.so: "Error
in loading shared library glinc-2.0.6.so".

After I investigated the problem, I found that the virtual addresses for
/etc/ld.so.cache and /lib/libc.2.0.6.so are the same: 0x2aaac000 in
do_mmap( ).

I would be very appreciated if you can give me any help.

Thank you.

Steven Liu
