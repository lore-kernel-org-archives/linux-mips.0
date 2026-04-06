Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01EDD33263B;
	Mon,  6 Apr 2026 12:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775478908; cv=none; b=cUJQSZAjywU+6oZkbxXYuADnNRnMTwGvH1ZgjsU67lIGQWXU3+A9Fb03w4sqh9Ezj2JUHydtNQbtEqfYsHkixiqDpcyToB7WGi1fBvm7qsCJnf4rhEwU3TOLi6OhHOxZcv8HXhCxtIzZGitczWji2ULSGXBO1Uajh5QaUZyjjJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775478908; c=relaxed/simple;
	bh=H+2FfBYArssBrKT6Tk+WP/mIDTn0QW4+GZOM/X0PTYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hvhk3nmGOjaopWjX+5w1OhmC0exra+b/JnYqLbgTT0y9GSlqX3tmJnhhQ67/wPp5XnsmB/g8rwpkUesr5MS2o2S3GoQ/ziB1bDZpMnxZYwfAOAJzxWAB1RjCy4pPxI208M5qook/UZEN0RnK+88ppCVPXY4IKbWGFtpIclnsWIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1w9jAQ-00040l-00; Mon, 06 Apr 2026 14:34:58 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 20329C0988; Mon,  6 Apr 2026 14:29:08 +0200 (CEST)
Date: Mon, 6 Apr 2026 14:29:08 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Shiji Yang <yangshiji66@outlook.com>
Cc: linux-mips@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] mips: pci-mt7620: add more register init values
Message-ID: <adOnFMS2l_diXevH@alpha.franken.de>
References: <OSBPR01MB1670555F549B69B9A5E7F133BC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
 <OSBPR01MB167036A58FE6FB745311AF5FBC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB167036A58FE6FB745311AF5FBC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>

On Wed, Jun 18, 2025 at 11:42:06AM +0800, Shiji Yang wrote:
> These missing register init values are ported from the vendor SDK.
> It should have some stability enhancements. Tested on both MT7620
> and MT7628.
> 
> Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
> ---
>  arch/mips/pci/pci-mt7620.c | 59 +++++++++++++++++++++++++++++---------
>  1 file changed, 46 insertions(+), 13 deletions(-)

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
