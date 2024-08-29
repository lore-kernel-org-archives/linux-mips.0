Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E78A18E75D
	for <linux-mips@vger.kernel.org>; Thu, 29 Aug 2024 08:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724921547; cv=none; b=lZlhyE07UJc5qcdg2HRn/KOjJHZ+BlA43MBHoA73foFq2+Gjy73E1cvq0o3jlj+Z19R8GoNvdif/0mtKyx+C3Y6rjE1AknhN0qr4QXZjGDmpqtW5qOYALd+5YfXZMFlUoWr4ufZ9qy1RmJTcfo9I5LdgeQPeRSFJlWMYQbUSLkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724921547; c=relaxed/simple;
	bh=lgr52ExhAwDOyxkzq+b5BeKph0CiRrYMLY8KxIBULwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=itMrc4Iaz8C8d8ojhAB9lvG27f+q5IQjHYJKEB5/v2sqvd6o8h1VBiMs8YIxPsdIRmi6AbAqWw0ack5iNN3qDtRidxgsZFf6m1MWB182bkag/pQ1iUG/0SOBwN5sYpzEKt1ks7AQ2VucE3cVo8joThKEi/NaTAQN9TQbMCP5e5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sjat5-0005mt-00; Thu, 29 Aug 2024 10:52:15 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id AE3E8C014D; Thu, 29 Aug 2024 10:35:13 +0200 (CEST)
Date: Thu, 29 Aug 2024 10:35:13 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
Cc: linux-mips@vger.kernel.org
Subject: Re: [PATCH -next] MIPS: Octeon: Remove unused codes of
 cvmx_fpa_shutdown_pool()
Message-ID: <ZtAywfd4PehJu2VO@alpha.franken.de>
References: <20240814103425.2051117-1-cuigaosheng1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240814103425.2051117-1-cuigaosheng1@huawei.com>

On Wed, Aug 14, 2024 at 06:34:25PM +0800, Gaosheng Cui wrote:
> The cvmx_fpa_shutdown_pool() has been removed since
> commit a03822ea5df6 ("MIPS: OCTEON: Remove some unused files."),
> the declaration and cvmx_ipd_free_ptr would not be used,so remove
> them.

/local/tbogendoerfer/korg/linux/drivers/staging/octeon/ethernet.c:958:2: error: implicit declaration of function ‘cvmx_ipd_free_ptr’; did you mean ‘cvmx_fpa_free’? [-Werror=implicit-function-declaration]
  958 |  cvmx_ipd_free_ptr();
 
Doesn't look unused to me.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
