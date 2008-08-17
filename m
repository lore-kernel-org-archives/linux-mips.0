Received: from hiauly1.hia.nrc.ca ([132.246.100.193]:62733 "EHLO
	hiauly1.hia.nrc.ca") by ftp.linux-mips.org with ESMTP
	id S28577606AbYHQObZ (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Sun, 17 Aug 2008 15:31:25 +0100
Subject: Re: missing compat_sys_ptrace conversions for mips and parisc
Date: Sun, 17 Aug 2008 10:31:18 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <48A8081A.4080609@gmx.de> from "Helge Deller" at Aug 17, 2008 01:14:34 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID: <20080817143118.7CD574E77@hiauly1.hia.nrc.ca>
Return-Path: <dave@hiauly1.hia.nrc.ca>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Helge Deller <deller@gmx.de>
Cc: hch@lst.de, kyle@mcmartin.ca, linux-mips@linux-mips.org, linux-parisc@vger.kernel.org
Message-ID: <20080817143118.kv5LbPHpSc9x19AsbkfJwxwUhTXuShLboUMbzATXgNQ@z>

> I could take care of this for parisc. Just looked into the code and it 
> seems it could cleanup the code nicely as well.
> 
> But I don't want to step on Kyle's toe, since I assume he prepares the 
> asm-parisc/ move in the parisc-2.6 git tree during the next days.
> 
> Kyle: any comments? Should I prepare some patches? Or do you want to 
> take care of the compat_sys_ptrace yourself?

In my builds, I noticed that there are also about five "new" syscalls 
that aren't wired up for parisc.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
