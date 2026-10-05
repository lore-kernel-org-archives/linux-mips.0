Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A87A43802B;
	Mon,  5 Oct 2026 13:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791206188; cv=none; b=URmKKi6PvBUIKkutNzc0pNFHd3fDOnOgYSG0Fhqlw/2E18YXqlN9FsK2hNVSILuO22aHgq/AQYxMHam+NnDa/pZmKlC/xmV5j1qnFzpknuOpLACoicGgqjbT5XuTyCEy3akmUN75jOi8HZVFFDmj0e3W5wRk4wFwQ8Mm/p3TaYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791206188; c=relaxed/simple;
	bh=Fnk/tmyQTQNDePyBhZNbtsfyYcbcxRxXOAOyUCGk2n8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Ahv44tuqhYBANd0QFgODkhdk5i3f2ulVP3vkyHS9fUcxrvSjVpAqbP4jDFSYCbnk2dlWM+I6K2GSHQVa9AwjscedkUeYMEoC+RqmWa5VHDpozeBCprXdh1SvQLIYEh93NNH6R7ILEVRqY+CKfLBpiOF82ps0unuenz+E7fdaSb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fIB4K0Q3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fIB4K0Q3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E3991F000FF;
	Mon,  5 Oct 2026 13:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791206186;
	bh=i/td4W5J9/S62zcyOJO05wzuJ4xv2HjsFw98h8R0yMg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=fIB4K0Q34ykYoN4dl2qegMqVNnE/oS9EYsEG3xw0J4K843rc26zY14yoy7irwUvlo
	 NcSlrcVyvORsm9s8Fbt8Ql5m/hHwlKekGehmugEBBgXQHggzhoSwZC8eOlbL0rrp4R
	 3libVZZs/qHU1aVCzEg4040yx4lG6WZhLsfiMAXvag07sbIGFGLs/AFYmSfWpMoojn
	 nVT3nKqdsvn2tkLtXSo0mrkm1Pah/WUApXw6AAUJEoVOUf5EezQQUcrM6mo/uWa8To
	 kc/PjNcrlcQmTXpiNO3C44AtWt74KgDjFmnLPTSOdcJTYiMh5xo2qrB8wkkfd5B940
	 NcnEOhmPlpQsQ==
Date: Mon, 5 Oct 2026 15:15:23 +0200 (CEST)
From: Imre Kaloz <kaloz@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 21/38] MIPS: SGI-IP27: route XBridge and PIC DMA through
 the 32-bit window
In-Reply-To: <asNiRoPpv6dkAFD4@infradead.org>
Message-ID: <2558b0af-cf4d-2f33-b93c-fc97b91ba89c@kernel.org>
References: <cover.1790857966.git.kaloz@kernel.org> <cce203c61386970826873f87cc9d0e6c732c3a53.1790857966.git.kaloz@kernel.org> <asNiRoPpv6dkAFD4@infradead.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

On Mon, 5 Oct 2026, Christoph Hellwig wrote:

> On Thu, Oct 01, 2026 at 06:11:56PM +0200, Imre Kaloz wrote:
>> XBridge does not honour the SN0-style 64-bit direct-mapped DMA address:
>> commands complete but no data moves. PIC moves no data either. Route
>> both through the 2GB 32-bit window and cap bus_dma_limit at its top, so
>> SWIOTLB bounces anything above it. PIC is flagged once a following
>> patch enumerates it.
>>
>> Only XBridge (part 0xd002) is flagged; a Bridge (0xc002) behind a Hub
>> keeps the 64-bit direct map. The 64MB bounce pool comes from node 0
>> whenever DRAM passes 2GB, on Hub any multi-node machine. A PIC bus in
>> PCI-X mode takes the window too; IRIX does not.
>
> It's been a while, but IIRC XBridge also support 64-bit direct-mapped
> DMA addresses, just differently.
>
> If you find a late 2.4 or early 2.6 kernel, it comes with an open source
> copy of the IRIX-style PCI code under arch/ia64/ that also includes the
> older chips never used on Altix.  It might be worth to take a look at
> that for clues.
>

Thanks, you were right. I dug out the SN1 pcibr from the old ia64
tree (Bedrock + XBridge, so about as close to this box as it gets),
and the XBridge difference is bit 55 in the 64-bit address, which
pcibr sets as the byte-swap attribute. Without it the Fuel's qla1280
never got any data back, which is what I based this patch on; with
the SN0 address plus bit 55 disk reads match the 32-bit window bit
for bit, on the Fuel's XBridge and on the Tezro's PIC alike.  The
IOC3 behind an XBridge still wants the window, so for v2 devices
with a 64-bit mask get the direct map and the rest stay on the
window.


Thanks again,
Imre
