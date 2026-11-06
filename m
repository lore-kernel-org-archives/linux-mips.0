Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793944862;
	b=XWAR57yVJNSlfL3awPvT4j5K4lvAuazBrQvrbAn2iDD3wtuhPtevE4ypPHHonKqsnqFN
	 I53XEv3JXv5tkRWHZaCSr5sJhMbCwkwkgwMN/qIKFG/b5HTTbUOggdbOcQ9cBuBjpdGdj
	 1DdpFnLH7jhxugug3IeGlHSRcuAXpPgTJUmveu1cVJRlPhcDR4YmFhS2zxf45s7tOEQQC
	 G1U4DBXc/eT6i9g5qpoolwFr/RfqxMbFSsGURSbnA0wYZnxcyA/djAMmtJLMXJvpHzC1F
	 o0Q7oqDp30Up4MMIedP1428DqWWRGbQZeEpVFrprFFrNKL+ILDbbqXmADyshw5dNdPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793944862;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type;
	bh=dTP+xj5PsNBDY+MWBzQDOTfIokkCl6mZq3AfbmkinjI=;
	b=gYIcO/IQVdINvMO31o+33obsMT/Hp5tethKIII+dvIAbRPRia6jNHfSW8OS3GVVQQ1O3
	 ZtToJgs+cSOw6dRfk8zuNkBiW9Xm34xye8LAeoV+BA7KnJKuc5fya9RfZcAoUjqrB7Ml9
	 QfHplfby4/dL80ObrV1aLuBgFpcoRoaIhGMkELgBDAoCixjgHK8vcSjXUBeGb4uUryfx9
	 p9eVOe5IJcOdlpZbrRg0UKNbGFIgQkk7R63LS04XXTbZN3TaSr1m6E2Y5MZl/+bjqjCID
	 vC+yQUjyPuR8DCLk9yNP+3swiAe9VfG3KV/whNHJ7rjgcr2aW/bsk2zaD1pgC9HxaDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D11606A326;
	Fri,  6 Nov 2026 06:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17D11606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id C35F892009E; Fri,  6 Nov 2026 07:00:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id BD20E92009C;
	Fri,  6 Nov 2026 06:00:53 +0000 (GMT)
Date: Fri, 6 Nov 2026 06:00:53 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Florian Fainelli <f.fainelli@gmail.com>
cc: linux-mips@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Thomas Gleixner <tglx@kernel.org>, 
    open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: SB1250: Validate and update IRQ affinity
In-Reply-To: <20261103215043.1190947-1-f.fainelli@gmail.com>
Message-ID: <alpine.DEB.2.21.2611060517330.17804@angie.orcam.me.uk>
References: <20261103215043.1190947-1-f.fainelli@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 3 Nov 2026, Florian Fainelli wrote:

> sb1250_set_affinity() selects the first online CPU in the requested
> affinity mask without checking whether such a CPU exists. If the
> intersection is empty, the resulting CPU index is invalid and must
> not be passed to cpu_logical_map().
> 
> Reject affinity masks containing no online CPU with -EINVAL before
> accessing the CPU mapping or interrupt mapper registers.

 Why do you think this is needed?  The only case where an unvalidated mask 
is passed is AFAICT with:

/**
 * irq_force_affinity - Force the irq affinity of a given irq
 * @irq:	Interrupt to set affinity
 * @cpumask:	cpumask
 *
 * Same as irq_set_affinity, but without checking the mask against
 * online cpus.
 *
 * Solely for low level cpu hotplug code, where we need to make per
 * cpu interrupts affine before the cpu becomes online.
 */

-- which does not apply here (nor for arch/mips/sibyte/bcm1480/irq.c, 
which uses analogous code and should otherwise be updated accordingly) 
since all the CPUs are onchip the SoC.

 Have I missed anything?

> Also update the effective affinity mask to reflect the single logical
> CPU selected as the interrupt target.

 Likewise, why is it needed?  This code returns IRQ_SET_MASK_OK (should 
really use the enumeration constant), so the caller will do the copy.

  Maciej
