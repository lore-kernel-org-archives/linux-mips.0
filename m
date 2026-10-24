Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.175.24.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792836954;
	b=TlmtRHw7M3MDLuLyx8A29xI5zetuBbmW6KplhvGMWJpY5aUHENlhDVAcJ68PAwDYT3/5
	 yf5JmLT1nbV9SdmJBOF30GPl0jaW3b6pBMM6dcOIuUevqXQ1dtBs06SacWRcSWwWGzy9X
	 HtcJIjm3kT2IE6TDqNSTioqxYKNFNzMfye1Kh25+75A3LsIv2M+zQnolvV8Xg6AUOGXTM
	 E5tZ7f1Ha3lBbCpl8b2n/DcDd+Qhi1vWAqCnRNH32n1+zCoDGqmpzVYJ8pZdfOU44Yxay
	 7F36sKZI9okDCUw6jKoBT2EUb97tv6sJnZYRiXnKBaLsPWiO+UnXdulrfLWSKjbM69Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792836954;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=JG3yz9TGL/T/zJk3WMhjx5ozEDaVJ/cW1kf3LazKGDU=;
	b=KCMEaiLMhnKWql2zg1ti6p2qBNQHI9qDjbx53aRtzy9Hjkr5XqioF9KAz4NDvPSFI+le
	 ilZBJTV1X5zRbhJq1xkB9x9J+xwFB7UzXPNvj1XYg6OhcOZ4IEi8kKEsv2sp5raDb56J0
	 pe6arYp9MHQ1i1yadd54mRwlK48zsPK9AjZJr/as6LG6zSH4gICVnQMW1TD5hsx7iHs2d
	 GC/d5ptrvMrF/zS0zNRGg2UfoNJLpX6MpQoFVrdWDZJXAfBScG4xpKX2/tA1wdeo6N7wU
	 PiUurlbff043mIB8HartCwjuwhVf7A+gLYrz9d6sOP8qW3KVbBTqUsjamw1rgrB/uOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=alpha.franken.de;
	spf=pass smtp.mailfrom=alpha.franken.de;
	arc=none smtp.remote-ip=193.175.24.41
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85112606A31B;
	Sat, 24 Oct 2026 10:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85112606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xKYn1-0005ZL-00; Sat, 24 Oct 2026 12:15:51 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id CE4A0C0423; Sat, 24 Oct 2026 12:12:17 +0200 (CEST)
Date: Sat, 24 Oct 2026 12:12:17 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Imre Kaloz <kaloz@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v2 23/53] MIPS: SGI-IP27: xbow_probe(): recognize
 KLTYPE_PBRICK_XBOW
Message-ID: <atyEgXoWLanAHb5V@alpha.franken.de>
References: <cover.1791890466.git.kaloz@kernel.org>
 <052c08ad27b1b882b27b3ced51f56194ed670637.1791890466.git.kaloz@kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <052c08ad27b1b882b27b3ced51f56194ed670637.1791890466.git.kaloz@kernel.org>

On Tue, Oct 13, 2026 at 03:16:43PM +0200, Imre Kaloz wrote:
> An IP35-family chassis records its crossbar board as KLTYPE_PBRICK_XBOW
> rather than the KLTYPE_MIDPLANE8 an Origin 200/2000 midplane carries, so
> xbow_probe() found no board record and never set up the crossbar. Fall
> back to the brick type when the midplane lookup misses, and warn when
> neither matches.
> 
> Signed-off-by: Imre Kaloz <kaloz@kernel.org>
> ---
>  arch/mips/sgi-ip27/ip27-xtalk.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/sgi-ip27/ip27-xtalk.c b/arch/mips/sgi-ip27/ip27-xtalk.c
> index 10834880c261..baa937b474a8 100644
> --- a/arch/mips/sgi-ip27/ip27-xtalk.c
> +++ b/arch/mips/sgi-ip27/ip27-xtalk.c
> @@ -159,8 +159,19 @@ static int xbow_probe(nasid_t nasid)
>  	 * need to probe xbow
>  	 */
>  	brd = find_lboard((lboard_t *)KL_CONFIG_INFO(nasid), KLTYPE_MIDPLANE8);

use

	brd = find_lboard_class(KL_CONFIG_INFO(nasid), KLCLASS_MIDPLANE);

instead, which looks for all midplane types.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
