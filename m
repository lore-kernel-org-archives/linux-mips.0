Message-ID: <AEC4671C8179D61194DE0002B328BDD2070C59@ATLOPS>
From: Dinesh Nagpure <dinesh_nagpure@ivivity.com>
Subject: un handled paging request, kernel v2.4.16
Date: Mon, 30 Sep 2002 16:21:30 -0400
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01C268BE.F60BF950"
Return-Path: <dinesh_nagpure@ivivity.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org, gcc-help@gcc.gnu.org
Message-ID: <20020930202130.GdkI0ejGjZS--V5o6YXhUAwWjWPquPzUBL7S87bgNHo@z>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01C268BE.F60BF950
Content-Type: text/plain;
	charset="iso-8859-1"

Hi,

In porting Linux kernel version 2.4.16 to our platform using the RM5231A, I
am struggling with this page fault for a couple of days now and would very
much appreciate any input to fix this.

Here is what I see is happening, after completing the initial boot up when
it is time to start the user-mode stuff I get a un handled paging request
fault.
------_=_NextPart_000_01C268BE.F60BF950--
