Message-ID: <3D171ECB.28F566C1@detewe.de>
Date: Mon, 24 Jun 2002 15:29:47 +0200
From: Carsten Lange <Carsten.Lange@detewe.de>
MIME-Version: 1.0
Subject: mipsel-linux-gdb(5.2): DW_FORM_strp pointing outside of .debug_str
 section
Content-Type: multipart/mixed; boundary="------------5CF768D46FA92DC52A37C165"
Sender: owner-linux-mips@oss.sgi.com
To: "'linux-mips@oss.sgi.com'" <linux-mips@oss.sgi.com>
Message-ID: <20020624132947.6Mpa_k-BlOScz-HPLyyqB1wHAo-t6M4WLeP_-PyaJok@z>

This is a multi-part message in MIME format.
--------------5CF768D46FA92DC52A37C165
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I get the above error from gdb 5.2 when using the <file> command.
...
(gdb) file iprbs
file iprbs
Reading symbols from iprbs...DW_FORM_strp pointing outside of .debug_str section
(gdb)                                                       
...

My mipsel-linux- toolchain consist of the following packages:
	binutils-2.12.1
	gcc-3.1
	glibc-2.2.5
	gdb-5.2

I have no idea what the problem might be.

Any hints (solutions/workaround) are welcome.

Best regards,
	Carsten
--------------5CF768D46FA92DC52A37C165
Content-Type: text/x-vcard; charset=us-ascii;
 name="Carsten.Lange.vcf"
Content-Transfer-Encoding: 7bit
Content-Description: Card for Carsten Lange
Content-Disposition: attachment;
 filename="Carsten.Lange.vcf"

begin:vcard 
n:Lange;Carsten
tel;fax:+49 6104 4234
tel;work:+49 30 6104 4228
x-mozilla-html:FALSE
url:http://www.detewe.de
org:Cordless Technology A/S Berlin
adr:;;Koepenicker Str. 180;10997 Berlin;;;
version:2.1
email;internet:Carsten.Lange@detewe.de
x-mozilla-cpt:;0
fn:Carsten Lange
end:vcard

--------------5CF768D46FA92DC52A37C165--
