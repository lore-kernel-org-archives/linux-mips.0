Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A7C6357CEB;
	Tue, 16 Jun 2026 11:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781607853; cv=none; b=ANSYfygo79nCLrNSmjECjstJd60EPMzLbqZf8xGE+08BN+UQHj5IbN8oad9H4VZYk75tAHfRtkdhCkg8avUeVjbme4C7rHdAJoGGaCR3xxAaZSYRfTkBuWKXpdeqG8lyzFCOdJ1PlDJIYJnU3x3/LzmxVB/lB26tQnzkO1xA5ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781607853; c=relaxed/simple;
	bh=YGGy4X5XartVgDqRWXWnqd9WogwE+vHNUSBe+2jbAW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vEVbo78iIqKcZeE9Cqj1qDd4icjBfIy+ktBJfsD6m+rNB6jwkZovKFqkxVFXLKkjJrqqDc90pV3giTTV/j0PCwXcoDyiu0f3jhnF6UdmXolprJvlCI5GYCo8owkrU+W+Z6WCt01BHDHnj3e9FI9mGhRcMWDJ19PaVyopY9ZrcXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wZRaN-0007FW-00; Tue, 16 Jun 2026 13:04:03 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 11DADC00E8; Tue, 16 Jun 2026 13:00:41 +0200 (CEST)
Date: Tue, 16 Jun 2026 13:00:41 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-mips@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [0/4] MIPS: kernel: proc: More efficient data output in
 show_cpuinfo()
Message-ID: <ajEs2UcAj-YmT1og@alpha.franken.de>
References: <e9e46083-c250-4e12-8620-f590e9501a25@web.de>
 <39fa676a-e761-4a33-9660-f366c692d4f1@web.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39fa676a-e761-4a33-9660-f366c692d4f1@web.de>

On Tue, Jun 16, 2026 at 12:34:18PM +0200, Markus Elfring wrote:
> > A few update suggestions were taken into account
> > from static source code analysis.
> 
> Does the feedback indicate so far that you would like to omit
> the patch “MIPS: kernel: proc: Simplify data output in show_cpuinfo()”?
> https://lore.kernel.org/linux-mips/5dcb1ae4-dc98-4f12-8ccb-ff47b16a326c@web.de/
> https://lkml.org/lkml/2026/6/4/1819

I prefer the way how text is formated over saving a few bytes/cylcles.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
