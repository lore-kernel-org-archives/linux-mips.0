Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B342EC562
	for <linux-mips@vger.kernel.org>; Tue, 10 Feb 2026 19:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770752253; cv=none; b=uoW8NWWGX84td9TwjoyVGs1YoNotvNr/6IToEcbsSaNeAHrzCxnBmZJg5ys/MLka08plDWifZ2GqVeh2kSo83YpPD2CrGknLIO5OJhpP/jXE/BKGuHDsR2wTKFFjAjEcnwaNpVW3tunEo1d6TNMKoZ/ACDFQmiQ72r6K9r6Fnn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770752253; c=relaxed/simple;
	bh=fRur79AaHqNQV3fBr4hf5Rrc3u8CGGPgcbZLe1PvlTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mY0sMlZrwo/lWKEDJ2qTYM//GFCq9/w/Tyqhxzj4qCCgdoF7QvKqEKKXMofz9taCsXKitJ/r+GOc7FfndyaUxzN7CNBgdOavUQs0dzkb9rJsnrVWUTZRf+sUfwqpB741Yju0qt/ixLxnOsQukulUiPHjqUFsOhNms4NYDjaWpOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R5fefDvU; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5fefDvU"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4376bd50b01so307934f8f.3
        for <linux-mips@vger.kernel.org>; Tue, 10 Feb 2026 11:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770752250; x=1771357050; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fqDz8Drx8XjDtZc8LsAC+uLDhKgLLYdxTPVtiF/ij7I=;
        b=R5fefDvUd00un7dIomu5/1O1/MvCC9JM8X4upAFz60c/ub91qrSPIuetKpbXV8gIqi
         YFQIyDLbTcJi+H4iRKR98ib6Wi6unP8GBW2b0tXYrRr5GwVkJcLlqUfhi2p/ot3Qv61t
         vurZ0WJYck/zenfGJSe0krk0uxKaQ4n9EfvIbRZYhbS6Ij42Bx47J/YbkWKXHOqvpyIq
         UzCkfipCNL7e2mC6H4SRCiOWeuDoaSnAqpvZzDrXKQpwh7H+d/ZQQ57ImxsLihOgZw/D
         ZxsJRacQL7ZMjkUamPG8ethuix9QCUOVfa/mWYeTh/25mymB0VRVXzFhZWaZznQmPEbC
         un8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770752250; x=1771357050;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fqDz8Drx8XjDtZc8LsAC+uLDhKgLLYdxTPVtiF/ij7I=;
        b=dY+SGptaknooLqdoRf4rDf4eIIr8HLcveE3n6F4oV1YKVFG+92Z301kopKFrrO6r2k
         QXlfEJgX2VP5H2lf63Mtjipe5EGREukn8IZYV2pj3sWe1+7jgGIjmr8uwvUmMkbPqPdT
         C5pyPVV7MEvSPYxfGajxyFlF07V+l5xe3rOvQxjhoKVX7tjYp0scKDTsidNhElgYcok0
         Y6ERydY9RzATAEvsO0X57PRF5l57vEDnmSMZpUVkE+7/lkBEjX6I7oqHa6RrXYam/n3h
         RiR11RZv6TVZM3A1jGctcYEdKA0jvQitYP4JN1HInVcLlAxaIa2otGwhwwUN2XAcU8Cj
         H7Mw==
X-Forwarded-Encrypted: i=1; AJvYcCXH05SA+J38Ky7SLeN/17JsDCDXrvRIrF0YMVeFGniyyIfA4z9YRYgrNOikbas1WBPZKo5quKvsIRhd@vger.kernel.org
X-Gm-Message-State: AOJu0YyY8YbaUvmlBgsK2sQqNEklKVKYQ29j/uPqhEI9i8kw+5k/dfex
	LssF1/ljqXF73A+43ZogmC4Xykl7Qn3FXu3L0honmMB9DuGWd2qo65mNfJirug==
X-Gm-Gg: AZuq6aLw2O66hmdGbmUqyO6WT9bW1f+b9Ows4Mr1QlL7CHg91+wrPJ42BLpGn0ER9zN
	vOTi5a4WdNlxcCCPVud/P4aJpVrDWSBYlvxOEK+0Tm21GiyFYf9F2Z2qWZtyrAOZ8uCOGkGVpYr
	UDi1lFNIAFUo4IWULKMBodAGjA0q3If2QnXpP52G9FnQQyBFFe8ul6Uk5KhmnOBfcR6AEKjDFbk
	EUwDiaIhwRskjFTbwwjvvT4cz8xq90CLNxvuK+glhZDLU3TSQMGpWRgsvZ6zz0LNA6vqyErW3Dz
	4nGn9sUCCbmGvvNuYHJIzOLNjvhvqPjV8gOyH1QxMjTTx0sLFZ/y7eFKJJtT2MLqfCUyNaUC1F5
	LcBBR+YtVUKfhzhTS7Ml4vjNFe91jeHkdiyME8cCPvHAlLvruE5v3Djg2IlycnpTErI3YZr7ufa
	MKxu+IziUt9d0PGF4=
X-Received: by 2002:a05:6000:3104:b0:437:771e:9dbd with SMTP id ffacd0b85a97d-4377aba5bd2mr2497517f8f.0.1770752250206;
        Tue, 10 Feb 2026 11:37:30 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:d8ac:c964:9b43:1b13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd4a1sm36328520f8f.17.2026.02.10.11.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 11:37:29 -0800 (PST)
Date: Tue, 10 Feb 2026 21:37:26 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: =?utf-8?Q?Gr=C3=A9gory?= Clement <gregory.clement@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org,
	=?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v6 2/8] phy: sort Kconfig and Makefile
Message-ID: <20260210193726.h6fc65gekida65la@skbuf>
References: <20260127-macb-phy-v6-0-cdd840588188@bootlin.com>
 <20260127-macb-phy-v6-2-cdd840588188@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260127-macb-phy-v6-2-cdd840588188@bootlin.com>

Hi Theo,

On Tue, Jan 27, 2026 at 06:09:30PM +0100, Théo Lebrun wrote:
> Neither Kconfig nor Makefile are sorted; reorder them.
> 
> $ diff -U100 <(grep ^config drivers/phy/Kconfig) \
>              <(grep ^config drivers/phy/Kconfig | sort)
> 
> $ diff -U100 <(grep ^obj-\\$ drivers/phy/Makefile) \
>              <(grep ^obj-\\$ drivers/phy/Makefile | sort)
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---

This patch is appreciated, however it no longer applies on top of
current linux-phy/next.

Since we are in the merge window currently, would you mind reposting in
2 weeks (or as RFC in the meantime)?
