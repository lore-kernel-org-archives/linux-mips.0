Message-ID: <007701c08f94$7de62360$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <3A79C869.2040001@Lineo.COM> <20010204194451.A26868@bacchus.dhis.org> <3A7ED9EB.6080801@Lineo.COM>
Subject: Re: NFS root with cache on
Date: Mon, 5 Feb 2001 17:55:39 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Quinn Jensen <jensenq@lineo.com>, Ralf Baechle <ralf@oss.sgi.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010205165539.9N-Ol9jwf0JvDFMxmtCB0cq3MXOs7TbCdIrEPhKd9mE@z>

> Another thing that has been haunting me is that
> in 2.3.99pre8, kmalloc() has and #ifdef __mips__ that
> flushes the cache and bumps the address up to KSEG1.

That's really hideous!  When did that happen?
It'll sure help cache coherency problems, but
the performance impact must have been monstrous.

            Kevin K.
