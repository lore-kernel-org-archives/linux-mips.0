Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AC93624C1;
	Mon, 27 Apr 2026 03:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261823; cv=none; b=hrYYezrykquJj0VVqhowR11qjI9vrPIJFKEA9W+VbF40dDBF5Y9IW2WPB+ufXVDJEX66OwvLdLEYvnVcH6WQRNd4bACD6sJ7313hI+aWuwflpYhASr6ZlxKgzm91YrykJtk353v8g6BlgnbVf/8kLN/2CvN3v6yWv+L69kqD5Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261823; c=relaxed/simple;
	bh=qXa8EDReuf95lO4KhoVaV10wu8JtCZ8BqYGhva3q0D4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dpq931PhQrgXCibUEXBLwQftKfNLD066ofcHS5zN+FrDbEiQLjjTof71IAh6xAhmLKA9AFZiV3aQ+9igBJF8oYqBhnMa80kPLxJ1cBetGREip/5ru3Z49AKVvvY+FGZKNXXZdP70sR9E+GP1WGHwwAvi6HkOl4QBBZ7937zeRJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NY+VSlHW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NY+VSlHW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D20B7C19425;
	Mon, 27 Apr 2026 03:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261822;
	bh=qXa8EDReuf95lO4KhoVaV10wu8JtCZ8BqYGhva3q0D4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NY+VSlHW6FzregzO0OMnnQ9ohNBVeYwTWORMtHbWPrtsHgAKynRQsgYj//JLm6d0m
	 ZO6eeWHXzMOS692aoLk+CYvXpqlVJTbJ+Iq3ADhXXCn/obkd4DTfAu3GXtmEmA1FfT
	 Sa5WQ7qMA/9vfN3eHsn3cNP2inutDRSrh1H6T324=
Date: Sun, 26 Apr 2026 20:55:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Maxwell Doose <m32285159@gmail.com>
Cc: tsbogend@alpha.franken.de, len.bao@gmx.us, yoelvisoliveros@gmail.com,
	error27@gmail.com, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v4] staging: octeon: remove SPI, POW, and PKO typedef
 enums
Message-ID: <2026042615-ambulance-upright-3041@gregkh>
References: <20260418230344.44242-1-m32285159@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260418230344.44242-1-m32285159@gmail.com>

On Sat, Apr 18, 2026 at 06:03:44PM -0500, Maxwell Doose wrote:
> This patch removes custom typedef enums and replaces them with standard
> enums to address the "General code review and cleanup" task in TODO.
> 
> The following enums are affected:
> 
> - cvmx_spi_mode_t (now enum cvmx_spi_mode)
> - cvmx_pow_wait_t (now enum cvmx_pow_wait)
> - cvmx_pko_lock_t (now enum cvmx_pko_lock)
> - cvmx_pko_status_t (now enum cvmx_pko_status)
> 
> This patch aligns the octeon codebase more closely with the Linux kernel
> code style, and will address the "cleanup" task in TODO.
> 
> Signed-off-by: Maxwell Doose <m32285159@gmail.com>
> ---
> v2:
>  - Appended "_e" to enum cvmx_helper_interface_mode to prevent namespace
>    collisions with a struct of the same name
>  - Fixed errors that were indirect results of the namespace collisions

How was this tested given that the previous ones all were not?

Also, this should be one commit per enum, right?  Why not make this a
patch series?

thanks,

greg k-h
