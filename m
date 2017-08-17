Received: from mailapp01.imgtec.com ([195.59.15.196]:6040 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23994851AbdHQBB0O9duI (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 17 Aug 2017 03:01:26 +0200
Date: Thu, 17 Aug 2017 02:01:08 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: undefined reference to `__multi3' when building with gcc 7.x
In-Reply-To: <20170804222500.GA11675@linux-mips.org>
Message-ID: <alpine.DEB.2.00.1708170155210.17596@tp.orcam.me.uk>
References: <20170803225547.6caa602b@windsurf.lan> <20170804000556.GC30597@linux-mips.org> <20170804151920.GA11317@linux-mips.org> <20170804174151.2eea9af3@windsurf.lan> <20170804222500.GA11675@linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-mips@linux-mips.org, Waldemar Brodkorb <wbx@openadk.org>, Matthew Fortune <Matthew.Fortune@imgtec.com>
Message-ID: <20170817010108.AkTP9NoAjwbFbTO5oGDUyyM-5k7Yu5eY5kYWcm_AnKw@z>

On Fri, 4 Aug 2017, Ralf Baechle wrote:

> Chances are it's something specific to MIPS64 R6.  Before trying your
> config file I also tried a number of other defconfigs and all built
> well.
> 
> Here's a test case which generates a reference to __multi3:
> 
> unsigned long func(unsigned long a, unsigned long b)
> {
>         return a > (~0UL) / b;
> }
> 
> GCC rearanges above statement to:
> 
> 	return (unsigned __int128)a * (unsigned __int128) b > 0xffffffff;
> 
> computing which requires 128 bit intermediate results.  This is the
> code generated for MIPS64 R2:
> 
> 	dmultu	$4,$5
> 	mfhi	$2
> 	sltu	$2,$0,$2
> 
> And this is for R6:
> 
> 	move	$2,$4
> 	move	$7,$5			# $6/$7 contain the second op
> 	move	$6,$0
> 	move	$4,$0
> 	move	$5,$2			# $4/$5 contain the first op
> 	sd	$31,8($sp)
> 	balc	__multi3
> 	sltu	$2,$0,$2

 This looks silly.  Why doesn't GCC simply emit:

	dmuhu	$2,$4,$5
	sltu	$2,$0,$2

instead?  It's even shorter than the R2 equivalent.

  Maciej
