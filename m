Message-ID: <001b01c0f871$6467efe0$910448c0@gv.com.tw>
From: "´¿¬L©ú" <kevin@gv.com.tw>
References: <20010615210433.A4282@paradigm.rfc822.org> <20010616041455.A19841@bacchus.dhis.org>
Subject: mipsel-linux-ld problem
Date: Tue, 19 Jun 2001 11:39:06 +0800
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0018_01C0F8B4.7272C5E0"
Sender: owner-linux-mips@oss.sgi.com
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010619033906.-_50O0TcmRQ2xKRq_X9wtFU5Cxt2NkYxe3Ch8lI2oRM@z>

This is a multi-part message in MIME format.

------=_NextPart_000_0018_01C0F8B4.7272C5E0
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: 7bit

dear all,
after we replace our mipsel-linux compiler tools with sgi's
we meet a problem which was not occurried before:
(any hint to fix? thanks alot in advanced!:)
##
genromfs -v -f rom_image -d /usr/mnt/rootfs
mipsel-linux-ld -EL -Tld.script.rd -b binary -o /usr/mnt/ramdisk.img
rom_image
##
mipsel-linux-ld: rom_image: compiled for a little endian system and target
is big endian
File in wrong format: failed to merge target specific data of file rom_image
##
(old compiler said:compiled for a little endian system and target is little
endian)
##
ld.script.rd :
OUTPUT_FORMAT("elf32-littlemips")
OUTPUT_ARCH(mips)
SECTIONS
{
  .data :
  {
    __rd_start = .;
    *(.data)
    __rd_end = .;
  }
}


------=_NextPart_000_0018_01C0F8B4.7272C5E0
Content-Type: application/octet-stream;
	name="ld.script.rd"
Content-Disposition: attachment;
	filename="ld.script.rd"
Content-Transfer-Encoding: quoted-printable

OUTPUT_FORMAT("elf32-littlemips")=0A=
OUTPUT_ARCH(mips)=0A=
SECTIONS=0A=
{=0A=
  .data :=0A=
  {=0A=
    __rd_start =3D .;=0A=
    *(.data)=0A=
    __rd_end =3D .;=0A=
  }=0A=
}=0A=

------=_NextPart_000_0018_01C0F8B4.7272C5E0--
