Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 584FA346FB5;
	Wed,  1 Apr 2026 20:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775075708; cv=none; b=IGSpci90O5EdssZuNYj7uf5+Wv89a4k5Qw6jwPhWwyuJqwFkcm+DA8FlcusiGbOzyIf63YIv2OVK4NyJtLUwpP19iwQQzCPXc20/Qw1KNk4IQDI/+vBesB7beeTy98exvzmhRgg1kqMzKqH6lSjwe+ZaQGwODx/XTj8mvCaPBU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775075708; c=relaxed/simple;
	bh=8xDmtM7MMJwN7aVk3oKXWQZQqKOxDClVvYcj7MHbOJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r5VcXVC7HfwWxByIMRsKgnUYwP3ecJAJp+FrMyC9XO5vLTg2JTyK0hCTOwON05mU/rOwnOAc7mmrQw7v0gihxhix1WZdIJtgkAS5VLdMZiiD7C4x/qUk5ZD5VhdhZB8kSiwFcaKa1LewmA0AIAV3LH/1xzXkQMd8Rte01DBVBZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1w82HK-0008Jp-00; Wed, 01 Apr 2026 22:35:06 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id CBB26C0256; Wed,  1 Apr 2026 22:34:35 +0200 (CEST)
Date: Wed, 1 Apr 2026 22:34:35 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Shiji Yang <yangshiji66@outlook.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	John Crispin <john@phrozen.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	stable@vger.kernel.org, Mieczyslaw Nalewaj <namiltd@yahoo.com>
Subject: Re: [PATCH] mips: ralink: update CPU clock index
Message-ID: <ac2BWx7_6Xgq_ldX@alpha.franken.de>
References: <OS7PR01MB136024C7662EB4DEC04ABC648BC74A@OS7PR01MB13602.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS7PR01MB136024C7662EB4DEC04ABC648BC74A@OS7PR01MB13602.jpnprd01.prod.outlook.com>

On Tue, Feb 24, 2026 at 10:22:50AM +0800, Shiji Yang wrote:
> Update CPU clock index to match the clock driver changes.
> 
> Fixes: d34db686a3d7 ("clk: ralink: mtmips: fix clocks probe order in oldest ralink SoCs")
> Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
> Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
> ---
>  arch/mips/ralink/clk.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

applied to mips-fixes

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
