Message-ID: <088d01c11f4a$c2a5eee0$3501010a@ltc.com>
From: "Bradley D. LaRonde" <brad@ltc.com>
References: <Pine.GSO.4.21.0108070937380.16434-100000@mullein.sonytel.be>
Subject: Re: cross-mipsel-linux-ld --prefix library path
Date: Tue, 7 Aug 2001 10:10:49 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010807141049.z66YmEgIuNw8whwyKqK_nLJTJJuLZ5yaomjgw4iDm_c@z>

Cool.  So, what is the purpose of having both $prefix/bin/mipsel-linux-ld
and $prefix/mipsel-linux/bin/ld?

Also, why is glibc installing libraries into $prefix/lib when
mipsel-linux-ld is looking in $prefix/mipsel-linux/lib?

Regards,
Brad

----- Original Message -----
From: "Geert Uytterhoeven" <Geert.Uytterhoeven@sonycom.com>
To: "Bradley D. LaRonde" <brad@ltc.com>
Cc: <linux-mips@oss.sgi.com>
Sent: Tuesday, August 07, 2001 3:40 AM
Subject: Re: cross-mipsel-linux-ld --prefix library path


> On Mon, 6 Aug 2001, Bradley D. LaRonde wrote:
> > Another odd thing is that binutils installs:
> >
> >     /usr/mipsel-linux/bin/mipsel-linux-ld
> >
> > and an identical copy at:
> >
> >     /usr/mipsel-linux/mipsel-linux/bin/ld
> >
> > This seems like a Clue.  If fact, the whole
>
> That's normal, I have
>
> | tux$ ls -li /usr/local/bin/*ld /usr/local/*/bin/ld
> |   62976 -rwxr-xr-x    2 root     staff      946678 Jun 11 15:47
/usr/local/bin/m68k-amigaos-ld*
> |   63675 -rwxr-xr-x    2 root     staff     1356730 Mar 12 11:17
/usr/local/bin/m68k-linux-ld*
> |   63660 -rwxr-xr-x    2 root     staff     1545874 Mar 12 11:16
/usr/local/bin/powerpc-linux-ld*
> |   62976 -rwxr-xr-x    2 root     staff      946678 Jun 11 15:47
/usr/local/m68k-amigaos/bin/ld*
> |   63675 -rwxr-xr-x    2 root     staff     1356730 Mar 12 11:17
/usr/local/m68k-linux/bin/ld*
> |   63660 -rwxr-xr-x    2 root     staff     1545874 Mar 12 11:16
/usr/local/powerpc-linux/bin/ld*
> | tux$
>
> The `duplicates' are just hard links (compare the inode numbers), so they
don't waste real space (except for the directory entries :-).
>
> BTW, I used --prefix=/usr/local.
>
> Gr{oetje,eeting}s,
>
> Geert
