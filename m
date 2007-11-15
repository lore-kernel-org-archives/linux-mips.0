Received: from mail.zeugmasystems.com ([70.79.96.174]:12252 "EHLO
	zeugmasystems.com") by ftp.linux-mips.org with ESMTP
	id S20032448AbXKOT0f convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Thu, 15 Nov 2007 19:26:35 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: "exportfs -a" -> stale NFS filehandle
Date: Thu, 15 Nov 2007 11:26:06 -0800
Message-ID: <DDFD17CC94A9BD49A82147DDF7D545C54DC8C7@exchange.ZeugmaSystems.local>
In-Reply-To: <DDFD17CC94A9BD49A82147DDF7D545C54DC88F@exchange.ZeugmaSystems.local>
From: "Kaz Kylheku" <kaz@zeugmasystems.com>
Return-Path: <kaz@zeugmasystems.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20071115192606.wqfIcNOL6Si-OMyM-UZU52yEmGUTf8W-2h91Ff8LNRg@z>

linux-mips-bounce@linux-mips.org wrote:
> Ralf Baechle wrote:
>> Can you test below patch?
>> 
>>   Ralf
> 
> [ snip ]
> 
>> -	PTR	sys_nfsservctl
>> +	PTR	compat_sys_nfsservctl
> 
> That's damn funny!

... but it doesn't work. Now the slave systems won't even boot at all.

  Looking up port of RPC 100003/2 on 127.3.0.1
  Root-NFS: Unable to get nfsd port number from server, using default
  Looking up port of RPC 100005/1 on 127.3.0.1
  Root-NFS: Server returned error -13 while mounting /cf2

Ah, but the reason for /that/ is that I have an n32 patch against
nfsutils in user space already, which has to be backed out.

After backing out the nfsutils patch, the diskless node does boot.

However, the original "exportfs -a" problem comes back!

So this problem is not resolved simply by using the correct compat
routine; it's deeper.

Sigh.
