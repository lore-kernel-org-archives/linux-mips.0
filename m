Message-ID: <sc35a6be.092@quicklogic.com>
Date: Fri, 04 Jan 2002 12:57:00 -0800
From: "Dan Aizenstros" <daizenstros@quicklogic.com>
Subject: Oops in do_mounts.c file.
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=_5B065C2E.AACB827B"
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20020104205700.eS-XMXVxn6rlo6BVsKMFMGabecIUyRgVTJmeG1ZnPZg@z>

This is a MIME message. If you are reading this text, you may want to 
consider changing to a mail reader or gateway that understands how to 
properly handle MIME multipart messages.

--=_5B065C2E.AACB827B
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello all,

I am getting an oops in the mount_root function if I
pass root=3D/dev/nfs to my 2.5.1 kernel.

I am also getting an oops in the mount_block_root
function if I pass root=3D/dev/hda3 to my 2.5.1 kernel.

The problem appears to be related to the following two
lines in the init/do_mounts.c file:

static char * __initdata root_mount_data;

static char * __initdata root_fs_names;

The __initdata macro appears to be incorrectly used.

In include/linux/init.h the explanation for the macro
says the __initdata should appear after the variable
name.  It also indicates that the variable shoud be
initialized.

The attached patch fixes the problem.

-- Dan A.


--=_5B065C2E.AACB827B
Content-Type: application/octet-stream; name="do_mounts.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="do_mounts.patch"

SW5kZXg6IGRvX21vdW50cy5jCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KUkNTIGZpbGU6IC9jdnMvbGludXgvaW5pdC9k
b19tb3VudHMuYyx2CnJldHJpZXZpbmcgcmV2aXNpb24gMS4xCmRpZmYgLXUgLXIxLjEgZG9fbW91
bnRzLmMKLS0tIGRvX21vdW50cy5jCTIwMDEvMTIvMTkgMDA6MDQ6MDEJMS4xCisrKyBkb19tb3Vu
dHMuYwkyMDAyLzAxLzA0IDIyOjAyOjIwCkBAIC0yMzksMTQgKzIzOSwxNCBAQAogCiBfX3NldHVw
KCJyb290PSIsIHJvb3RfZGV2X3NldHVwKTsKIAotc3RhdGljIGNoYXIgKiBfX2luaXRkYXRhIHJv
b3RfbW91bnRfZGF0YTsKK3N0YXRpYyBjaGFyICogcm9vdF9tb3VudF9kYXRhIF9faW5pdGRhdGEg
PSBOVUxMOwogc3RhdGljIGludCBfX2luaXQgcm9vdF9kYXRhX3NldHVwKGNoYXIgKnN0cikKIHsK
IAlyb290X21vdW50X2RhdGEgPSBzdHI7CiAJcmV0dXJuIDE7CiB9CiAKLXN0YXRpYyBjaGFyICog
X19pbml0ZGF0YSByb290X2ZzX25hbWVzOworc3RhdGljIGNoYXIgKiByb290X2ZzX25hbWVzIF9f
aW5pdGRhdGEgPSBOVUxMOwogc3RhdGljIGludCBfX2luaXQgZnNfbmFtZXNfc2V0dXAoY2hhciAq
c3RyKQogewogCXJvb3RfZnNfbmFtZXMgPSBzdHI7Cg==

--=_5B065C2E.AACB827B--
