Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BC3D4D0CD4;
	Fri,  2 Oct 2026 15:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955994; cv=none; b=ikZr4d3fUeoWTIV0q+V10OMR2jN33a8YHuIdllA8D9Cz+Wg48UV6ma3UNsi8ANxOBqQfbor54N2QpzueRWCjZTa7s420Q14AgWmlSMtcwGKqFQOi2vLgskbM9R/5kPZQNiONoGZkrm7Yy2QZaU54Ys/7o+COySTUCQcaTExCwc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955994; c=relaxed/simple;
	bh=aHIcbXNWjFrIJEoPOutanvbqUyJf7lZvlqJChge4BmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H/5iiGLr4ftQv9ZwBx0/uBmbxgD9F2ZYzGdhxN1TO0cnK2wa9i60eDXK5WEmn5lM8p1vGtN6Er9JeaZLCOobkyeAX01qS6c51O8T2RuKIph5yQlTQoCqjPeEXa0RHG5hti4qC3Hz8SoBnAxHfeCt2oC8ebdd8EPpaoyPBcnNLTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xCfSp-0006Yb-00; Fri, 02 Oct 2026 17:46:23 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 208C8C02BE; Fri,  2 Oct 2026 17:46:15 +0200 (CEST)
Date: Fri, 2 Oct 2026 17:46:15 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Imre Kaloz <kaloz@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/38] MIPS: SGI-IP27: add support for the IP35 (Bedrock
 hub) machines
Message-ID: <ar_Rx5PR5cI-gigR@alpha.franken.de>
References: <cover.1790857966.git.kaloz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1790857966.git.kaloz@kernel.org>

On Thu, Oct 01, 2026 at 06:11:35PM +0200, Imre Kaloz wrote:
> This series adds support for the SGI machines built around the Bedrock
> hub (IP35), such as Fuel and Tezro, to the IP27 platform code.
> 
> 
> Patches 1-17 teach the IP27 code the Bedrock hub: detection, the node
> address layout and register windows, the node id, CPU slots, memory
> banks, both PIs and the kernel load address.
> 
> Patches 18-27 add the crossbar, bridge and I/O parts of these machines:
> PXBow, XBridge, PIC and IOC4.
> 
> Patches 28-38 add the L1 system controller and what it provides, the
> Odyssey graphics widget, the KLCONFIG console and a topology package
> id per CPU.
> 
> Tested on SGI Fuel and Tezro. The NMI dump reaches the 8250 console
> only with "MIPS: SGI-IP27: print the NMI dump on an nbcon console",
> posted separately.
> 
> On IP27 (Hub) machines:
> - patch 17 moves the kernel up by 144KB, and the 144KB below it stays
>   reserved and unused;
> - with patch 21 SWIOTLB takes 64MB of node 0 on a multi-node Origin;
> - the XBridge DMA window (patch 21) and the w1 change (patch 33) do
>   nothing on a Hub with classic Bridges.
> 
> Given I have no IP27 boxes, none of this was booted on one.
> ip27_defconfig and ip30_defconfig build at every patch.
> 
> An XBridge or PIC on a Bedrock hub takes its board setup from the
> first board part number the L1 reports that the setup table knows
> (patch 30), so on a machine with several bricks every such bridge gets
> that one board's setup.
> 
> Patch 36 registers the Odyssey graphics widget as the "sgi-odyssey"
> platform device used by the Odyssey DRM driver, a separate series.

thank you for your patches, I'm going on vacation tomorrow for 2 weeks,
so I'll look at them after it.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
