Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C125D200B8E;
	Tue, 12 Nov 2024 15:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731424160; cv=none; b=ljlQpMLpgzfAZJL1ZaNTnhLlZl1gkYiudALCMc2PSMJfpLWvYfGPOOrMIkbERcT88tbj3tVfJ6J0AlXsXWq5GTmnyuWMBD23R1P6eAWyqnGEAlOrBIJIpZKzPfk3JVGI3XfKHxnO199aUG5HnIkY4J+5vO5ZrayLz6BI+L8ufKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731424160; c=relaxed/simple;
	bh=jeqNT81bZW90UN8U0ahCFddoiPgMIvBvHNcMhZjanzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cvACC92Nl1PYhyYa75gg3Dd/PbJPHiPJ4bzlq77JHulFXU95Da7GInnjJE6LuQV9IJlgkX5aUxNviqdAd1tRARB8F/qupdZ9xsmg1OaqFz5hbOhe8F93i05T6Z/iVOAOLNt9f4HFHpqkdAiNixukYgsxzlNHhG2RT7/FFHwCV4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tAsVf-0004rV-00; Tue, 12 Nov 2024 16:08:51 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id CE53BC014D; Tue, 12 Nov 2024 15:56:56 +0100 (CET)
Date: Tue, 12 Nov 2024 15:56:56 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: kernel: proc: Use str_yes_no() helper function
Message-ID: <ZzNsuMHPTJJGau98@alpha.franken.de>
References: <20241105173837.37756-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105173837.37756-2-thorsten.blum@linux.dev>

On Tue, Nov 05, 2024 at 06:38:36PM +0100, Thorsten Blum wrote:
> Remove hard-coded strings by using the str_yes_no() helper function.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  arch/mips/kernel/proc.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
