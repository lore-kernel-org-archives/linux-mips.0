Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0230E3358DA;
	Mon,  6 Apr 2026 12:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775478909; cv=none; b=Lozql5mQBMMRpu4yxo3R+NS1qXpt0hWYo+8LaG1V6K18JEWXepV+sLzkIpk45r4ojrvup5JQOfRmwAN+d9N0w2E8UzKgSvD+pRk8ixRT22wSWMA9ExiR4nuvMN5GeIRKrdBRPaJxEMGAEnv9GtPwgDRLT/cCfeCXNIzBXtxj4Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775478909; c=relaxed/simple;
	bh=+fbdO/JbPYWoofNghV77hxNXlYPmmFqqTbyNMjD4Yp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mxkC9bpwwSKgNxBRIDHLZJlkBQw3sAblZ1XadrUdtDL1GCBXvAVDVRKMAlcoyqNiCu8tM+8j/t0T4vqFJqCrkjdDhWzV1RUf7VhABcGqGQNNvTpuVFldyM7IpX87qcSxWKA0V4UASFqP1cRKY/rr1jhIjJYaZOCui04FJa/Xk8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1w9jAQ-00040p-00; Mon, 06 Apr 2026 14:34:58 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 0DB2EC0C39; Mon,  6 Apr 2026 14:29:28 +0200 (CEST)
Date: Mon, 6 Apr 2026 14:29:28 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Shiji Yang <yangshiji66@outlook.com>
Cc: linux-mips@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/3] mips: pci-mt7620: rework initialization procedure
Message-ID: <adOnKBet9PT-xbKv@alpha.franken.de>
References: <OSBPR01MB1670555F549B69B9A5E7F133BC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
 <OSBPR01MB167090804D80D1166900D7BCBC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB167090804D80D1166900D7BCBC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>

On Wed, Jun 18, 2025 at 11:42:07AM +0800, Shiji Yang wrote:
> Move the reset operation to the common part to reduce the code
> redundancy. They are actually the same and needed for all SoCs.
> Disabling power and clock are unnecessary for MT7620 and will be
> removed. In vendor SDK, it's used to save the power when the PCI
> driver is not selected. The MT7628 GPIO pinctrl has been removed
> because this should be done in device-tree. Some delay intervals
> have also been increased to follow the recommendations of the SoC
> SDK and datasheet. Tested on both MT7620 and MT7628.
> 
> Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
> ---
>  arch/mips/pci/pci-mt7620.c | 38 +++++++++++++-------------------------
>  1 file changed, 13 insertions(+), 25 deletions(-)

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
