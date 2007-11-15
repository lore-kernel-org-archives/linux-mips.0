Received: from mail.zeugmasystems.com ([70.79.96.174]:42712 "EHLO
	zeugmasystems.com") by ftp.linux-mips.org with ESMTP
	id S20032184AbXKOSio convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Thu, 15 Nov 2007 18:38:44 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: "exportfs -a" -> stale NFS filehandle
Date: Thu, 15 Nov 2007 10:38:37 -0800
Message-ID: <DDFD17CC94A9BD49A82147DDF7D545C54DC88F@exchange.ZeugmaSystems.local>
In-Reply-To: <20071115004821.GA32332@linux-mips.org>
From: "Kaz Kylheku" <kaz@zeugmasystems.com>
Return-Path: <kaz@zeugmasystems.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20071115183837.lLIHH8rQxhgUf34COv19BJJW8QGmcYvnH3jSvMuBN0A@z>

Ralf Baechle wrote:
> Can you test below patch?
> 
>   Ralf

[ snip ]

> -	PTR	sys_nfsservctl
> +	PTR	compat_sys_nfsservctl

That's damn funny!

I checked for replies this morning, but your e-mail went to my inbox
rather than my linux-mips folder, so I didn't see it.

I just made that change just moments ago. 

As I'm compiling it, a coworker says, ``Kaz, did you see Ralph's
reply?''. :)

Nope!
