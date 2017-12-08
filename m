Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:53575 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990436AbdLHX4wkkU20 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 9 Dec 2017 00:56:52 +0100
Date: Fri, 8 Dec 2017 23:52:05 +0000
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: Re: [PATCH] MIPS: Implement __multi3 for GCC7 MIPS64r6 builds
In-Reply-To: <20171207072046.31125-1-jhogan@kernel.org>
Message-ID: <alpine.DEB.2.00.1712082339130.4584@tp.orcam.me.uk>
References: <20171206085034.3869dc9d@windsurf.lan> <20171207072046.31125-1-jhogan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <jhogan@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Matthew Fortune <matthew.fortune@mips.com>, Florian Fainelli <florian@openwrt.org>, Waldemar Brodkorb <wbx@openadk.org>, linux-mips@linux-mips.org
Message-ID: <20171208235205.uD4C8VqkPNXIXkFWYZ-Qzt2enkYEsRRpIZrF-yddUw8@z>

On Wed, 6 Dec 2017, James Hogan wrote:

> GCC7 is a bit too eager to generate suboptimal __multi3 calls (128bit
> multiply with 128bit result) for MIPS64r6 builds, even in code which
> doesn't explicitly use 128bit types, such as the following:
> 
> unsigned long func(unsigned long a, unsigned long b)
> {
> 	return a > (~0UL) / b;
> }
> 
> Which GCC rearanges to:
> 
> return (unsigned __int128)a * (unsigned __int128)b > 0xffffffff;

 You mean:

return (unsigned __int128)a * (unsigned __int128)b > 0xffffffffffffffff;

presumably, or is there another bug here?

> Therefore implement __multi3, but only for MIPS64r6 with GCC7 as under
> normal circumstances we wouldn't expect any calls to __multi3 to be
> generated from kernel code.

 That does look bad; I'd expect a `umulditi3' (widening 64-bit by 64-bit 
unsigned multiplication) kind of operation instead, which should expand 
internally.  And we only really need to execute DMUHU and then check the 
result for non-zero here, because the value of the low 64 bits of the 
product does not matter for the evaluation of the expression.

 I don't know offhand if such a transformation can be handled by GCC as it 
stands by tweaking the MIPS backend without a corresponding update to the 
middle end though.

  Maciej
