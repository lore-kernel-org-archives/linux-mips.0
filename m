Received: from mx2.suse.de ([195.135.220.15]:42878 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23992615AbeFBNnDp6md3 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Sat, 2 Jun 2018 15:43:03 +0200
Date: Sat, 2 Jun 2018 15:42:53 +0200
From: Thomas Bogendoerfer <tbogendoerfer@suse.de>
Subject: Re: [PATCH] Make elf2ecoff work on 64bit host machines
Message-ID: <20180602154253.5a65264ec4d11a8c8a16ef1a@suse.de>
In-Reply-To: <20180601000311.lgwempsux7hnz7pn@pburton-laptop>
References: <20180528112625.25509-1-tbogendoerfer@suse.de>
        <20180601000311.lgwempsux7hnz7pn@pburton-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-Path: <tbogendoerfer@suse.de>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Burton <paul.burton@mips.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20180602134253.atgR2rcXNHVUfP4rY3H4I2YGuYSDDV-pku6G5AXpY0Y@z>

On Thu, 31 May 2018 17:03:11 -0700
Paul Burton <paul.burton@mips.com> wrote:


> Perhaps we should #include <stdint.h> before making use of the types it
> provides?

good point, will send a new version.

> > @@ -518,7 +518,7 @@ int main(int argc, char *argv[])
> >  
> >  		for (i = 0; i < nosecs; i++) {
> >  			printf
> > -			    ("Section %d: %s phys %lx  size %lx	 file offset %lx\n",
> > +			    ("Section %d: %s phys %x  size %x	 file offset %x\n",
> 
> Maybe #include <inttypes.h>, then use PRIx32 & co here & below?

I'll have look.

Thomas.
