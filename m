Received: from mail-bw0-f208.google.com ([209.85.218.208]:55981 "EHLO
	mail-bw0-f208.google.com" rhost-flags-OK-OK-OK-OK)
	by ftp.linux-mips.org with ESMTP id S1492641AbZI1OI6 (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Mon, 28 Sep 2009 16:08:58 +0200
MIME-Version: 1.0
In-Reply-To: <1249894154-10982-1-git-send-email-wuzhangjin@gmail.com>
References: <1249894154-10982-1-git-send-email-wuzhangjin@gmail.com>
Date: Mon, 28 Sep 2009 16:08:52 +0200
Message-ID: <f861ec6f0909280708o42ceb334u4d33e141b9c51efa@mail.gmail.com>
Subject: Re: [PATCH -v1] MIPS: add support for gzip/bzip2/lzma compressed
	kernel images
From: Manuel Lauss <manuel.lauss@googlemail.com>
Content-Type: text/plain; charset=ISO-8859-1
Return-Path: <manuel.lauss@googlemail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Wu Zhangjin <wuzhangjin@gmail.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Alexander Clouter <alex@digriz.org.uk>
Message-ID: <20090928140852.Krq4G1nZNtLTyX2uc63A9LRSZEvMbONcSY49fXc9dkM@z>

Hi Wu!

On Mon, Aug 10, 2009 at 10:49 AM, Wu Zhangjin <wuzhangjin@gmail.com> wrote:
> This patch will help to generate smaller kernel images for linux-MIPS,

I just gave it quick spin on my Alchemy boards, works quite well!

For the debug code (dbg.[ch]) I suggest you leave the actual uart-banging
to board code (either in the form of cpp macros or inlined functions)
because most chips either don't have a 16550 compatible uart or (in the
alchemy case) have a 16550 with non-standard register layout.

Thanks you for your work!
        Manuel Lauss
