Received: from zproxy.gmail.com ([64.233.162.201]:39960 "EHLO zproxy.gmail.com")
	by ftp.linux-mips.org with ESMTP id S8133443AbWAPMTz (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Mon, 16 Jan 2006 12:19:55 +0000
Received: by zproxy.gmail.com with SMTP id l8so1101018nzf
        for <linux-mips@linux-mips.org>; Mon, 16 Jan 2006 04:23:26 -0800 (PST)
Message-ID: <f07e6e0601160423h5ce1c0d7lcb7e38f8509c4116@mail.gmail.com>
Date: Mon, 16 Jan 2006 17:53:26 +0530
From: Kishore K <hellokishore@gmail.com>
Subject: gcc -3.4.4 and linux-2.4.32
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_5435_18690732.1137414206474"
Return-Path: <hellokishore@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20060116122326.5KV-RLeWGmQ8L-sjhEgWgg_s1dHj3rBozniK-KdYv2U@z>

------=_Part_5435_18690732.1137414206474
Content-Type: multipart/alternative;
	boundary="----=_Part_5436_32105947.1137414206474"

------=_Part_5436_32105947.1137414206474
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

hi
When 2.4.32 kernel (from linux-mips) is compiled with the tool chain based
on gcc 3.4.4 and binutils 2.16.1, the kernel crashes on malta board. The
crash file is enclosed along with the mail. If the same kernel is compiled
with the tool chain based on gcc 3.3.6, no problem is observed.

May I know, whether it is because of the changes in ABI in gcc 3.4. If so,
has any one got the patch to make 2.4.x kernels work with gcc 3.4 compilers=
?
------=_Part_5436_32105947.1137414206474--

------=_Part_5435_18690732.1137414206474--
