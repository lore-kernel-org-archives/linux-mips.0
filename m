Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C273F313531;
	Mon,  3 Aug 2026 13:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785762949; cv=none; b=C0Y4EKB0aWulDNFIv8GOMK2kr7121JouJV8qE6zRjLmncXfiZ/b2oXv2YTcxmesvs4FAiba9GvV3FUzTrtAsM0l3230PjjxSZcmigLVmxLwjuY6D9HQN6b4/e60YUjQFr5HwzDvYmOLZcbXX8Ec0brkgJSJhb9Qh741NWljeRrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785762949; c=relaxed/simple;
	bh=T/vGjWzQuh08DtM/tEEgQ4fO2d2Df/FoXussaiYzm2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OWr9B1xh1D7CmjBMSHNoFds5Mb7S33cZggYJElU4EV8gB0fUcSPuLoxvQgWA/GztYq/zxpXZNNFoczGZ4peG6COMVZdRsBiqvKelIQboj8InJ9i23GOeoV8ViKzn6i301cf2ohRK4fMJUV8HWrHS0qZDNe+NcaeJJl9r6IYpVds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wqsW1-0002bv-00; Mon, 03 Aug 2026 15:15:37 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 86667C0110; Mon,  3 Aug 2026 15:14:41 +0200 (CEST)
Date: Mon, 3 Aug 2026 15:14:41 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] mips: econet: add multi-vpe capability to EN751221
Message-ID: <anCUQbjVYwg9SKWY@alpha.franken.de>
References: <20260728184959.102441-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728184959.102441-1-cjd@cjdns.fr>

On Tue, Jul 28, 2026 at 06:49:57PM +0000, Caleb James DeLisle wrote:
> The EN751221 is a MIPS 34Kc so it supports MIPS_SMP_MT, but until now
> this was disabled because to enable it requires the interrupt
> controller to be in VEIC mode and previously only cascading mode was
> supported by the interrupt controller driver. Since
> commit 2ee2a685ee83 ("irqchip/econet-en751221: Support MIPS 34Kc VEIC mode")
> the intc driver now supports VEIC mode. Add SMP_MT to init.c and
> update the Device Tree to recognize dual VPE.
> 
> Caleb James DeLisle (2):
>   mips: econet: add multi-vpe capability to EN751221
>   mips: dts: econet: Describe dual-VPE 34Kc processor
> 
>  arch/mips/boot/dts/econet/en751221.dtsi |  7 +++++
>  arch/mips/econet/Kconfig                |  4 +--
>  arch/mips/econet/init.c                 | 42 ++++++++++++++++++++++++-
>  3 files changed, 49 insertions(+), 4 deletions(-)

series applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
