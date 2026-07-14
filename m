Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F048F3DA5BA;
	Tue, 14 Jul 2026 22:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784066889; cv=none; b=QVjB8WG7QgrrkYRvF1y+lNmF4uynRgLXfhSoI6Us1hlEk7JrPhbdqivI6rQNUGoXmetVL0W40hCmcoeHM/xnD2FTQ+50XdhcBSuQzIhcLLnT/lRSX4LdmcFaOi4YpL8lOdh6rjbMH1+Lf2TU1GskYiXhIWOKTjP1hj0cMKsDTPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784066889; c=relaxed/simple;
	bh=fQZjCkLG/7BvHPHGMGFdT8OJvKSTTFC326JDS7Hw/KE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cnCb4VOy2b4WVJkQoF9kWb8aTo0xJgtAPuq92vpm/EqUNtP+vvvVvqSHGPJQfvWYxGCf3/VzOSX/jpHXU63qOlg47K5EfYpCXsmGzdJCgdKKnLCZXV3+TmGmEQKwYVJ1qwFv826vnaXcp9zAAvWb0GnK/WJF5E/8iN2ah6YDVkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bgTzHB9o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bgTzHB9o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C4EB1F000E9;
	Tue, 14 Jul 2026 22:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784066888;
	bh=JQeuVqK4HY8Dr6NmEwStHi+ThicciF0gRHayWVQwtrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bgTzHB9ovO51cjAruozOAu+mo5+cMYwa9cSkfmL0Mp/bh14ZqbNRxxLQxqOZp+jLZ
	 b4xpOXqmoC3h9uyOWOkKUaqEZA45kLvVbUhscldXfj2htIaTzVz+IUDEz+hqj/RQXA
	 +BBtghpdoaOWh22IHELA5dZj0QyqLGuuz4Re4YUh2Nbx/QSM4o7HeRkDGpRXtDbePL
	 emNjyTVN1E1lEpmCQbm9o5/7ZLv95WJlwfEUlgb7LiLT+JLb1wEXTINjlovRs9IAVk
	 MjYl3e3HLdio1gQVAfkl7IU94awJfUvOePQrINkdgRvLYpdfLOv/9m68cQeIIH+SOz
	 8taC7c5zC9IQw==
Date: Tue, 14 Jul 2026 17:08:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Udaya Kiran Challa <challauday369@gmail.com>
Cc: skhan@linuxfoundation.org, conor+dt@kernel.org,
	linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	me@brighamcampbell.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: watchdog: microchip,pic32mzda-dmt: Convert
 to DT schema
Message-ID: <178406688708.3037481.6414192882451546243.robh@kernel.org>
References: <20260701171917.263050-1-challauday369@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701171917.263050-1-challauday369@gmail.com>


On Wed, 01 Jul 2026 22:49:17 +0530, Udaya Kiran Challa wrote:
> Convert Microchip PIC32 Deadman Timer devicetree binding
> from legacy text format to DT schema.
> 
> Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
> ---
>  .../bindings/watchdog/microchip,pic32-dmt.txt | 19 --------
>  .../watchdog/microchip,pic32mzda-dmt.yaml     | 45 +++++++++++++++++++
>  2 files changed, 45 insertions(+), 19 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/microchip,pic32-dmt.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/microchip,pic32mzda-dmt.yaml
> 

Applied, thanks!

