Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01E26329E55;
	Mon,  6 Apr 2026 12:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775478910; cv=none; b=TTv3rEizpkwMw07h7y2caR6CVOtT4WKI4XtHILrPdQohHFHjpOg37cWPvBsKuKCftskNHcYn1XNeWIoNRlFVZle51UEthEV50K3tc/XeaNLsBQ68YU8XB64JfeXilibJEbjUcNHo4aPjupuuDNGHOQAl03JfOYtQyLqIUdQu0RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775478910; c=relaxed/simple;
	bh=f5AlTf/3m923V7ERfCsNqA++B5I/W/O4Ou/+t8whxkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VjWGrwkKbBdvVkhTq7vWbCbranHq+z+nJ/ey2+LhZ5qn7Dlh8biXNBuLk4TlWaNb3H6vAfV2JVkxoxHKlg96+yl82MSlDWGKFLqW16hU7G/5c3m7sDruCFzOslvpVHXOR8VYc2cAsM9GIcynNL2Kmh6NF1MZP0DizqMTnY00IYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1w9jAQ-00040n-00; Mon, 06 Apr 2026 14:34:58 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 40202C0256; Mon,  6 Apr 2026 14:28:48 +0200 (CEST)
Date: Mon, 6 Apr 2026 14:28:48 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Shiji Yang <yangshiji66@outlook.com>
Cc: linux-mips@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] mips: pci-mt7620: fix bridge register access
Message-ID: <adOnAAkIuuMAro1U@alpha.franken.de>
References: <OSBPR01MB1670555F549B69B9A5E7F133BC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB1670555F549B69B9A5E7F133BC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>

On Wed, Jun 18, 2025 at 11:42:05AM +0800, Shiji Yang wrote:
> Host bridge registers and PCI RC control registers have different
> memory base. pcie_m32() is used to write the RC control registers
> instead of bridge registers. This patch introduces bridge_m32()
> and use it to operate bridge registers to fix the access issue.
> 
> Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
> ---
>  arch/mips/pci/pci-mt7620.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
