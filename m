Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185476;
	b=vfDdzkqm+eA/E0v3RaUWj3HIMVRmhPOpLg9SjC7aQSg+R/lJnVn/guJjhKFxb0/0J72w
	 3Ejqj45KK2efnaiAEGqJekiG5Sc1Fb9DgtKFQYQaxWDvVsFQbdoWtfvBhlMW29Yaazk39
	 g9bEXaTizQv4cTsSirOar03hYCXNAjCur8QSQwbEUx593/swLm5TYw7glU5LuLxin25sz
	 ziSj7CF6/e6x9dU9ZSwb1oEQfLCBnBkfPlzMoq/OL/c8uK3XOIHa8Ox/+Bl3cBuYyXFZc
	 rLk0A9n/Br51N3PWcBa8v9+3SoNNtaqJqinUVloK0AugI85AEpBgU2XTNRruw/BLrwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185476;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=G3Dx1Rl8sCVhKobWtk/mYO5a3CKsB1ub+4mYD8rlpqA=;
	b=jHEJErtianIO0r+uC8A0N81W6ELaeJGZTGi2NziGuCfF1HukpnnG+uuJWeWBZ5DwuC8P
	 ZGG4LbcEIeavuxZFG2L0t49vQaKuPUzFE0Zg275kC3Jkd5ZZWJLRHyjaA/kPzjSAvWKcX
	 3ep5I+iA40Ovi6nyClRgQBnGi8sud3e9VseA/qR1PTORS3wk+z+quD53kDseE1l0gArNs
	 DsQlff6Nh2MNDJUqAJ7pknupXoG1/2lpgaL7781DFHWpDjHCuihGwP6Hf5hdYXrdU5FzC
	 hIn8X9RxczpgXDByxm3pbNsjl1BtRXimOX4XF4Dt/U8pIOUsCGpn+OjrQcp5PUFA5xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=gwalE1n6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C098606A325;
	Fri, 20 Nov 2026 14:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=gwalE1n6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB0291F000D1;
	Fri, 20 Nov 2026 14:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795185476;
	bh=G3Dx1Rl8sCVhKobWtk/mYO5a3CKsB1ub+4mYD8rlpqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gwalE1n6xg8+aCz8tzdSBMFT4OzhyXzaXSdy+DLoS1DsZAikhr7lisJBMxV539KUQ
	 MqnNESWJyCDJbAv8ljr1HKFYRmGmc2yP3vANzHQ0+LdXeTEwOFxgXjv/xvU9lRBrwQ
	 t5QM+eIdfkQQNnula0BGl2GryflsnzCOKQe5pE9U=
Date: Fri, 20 Nov 2026 15:37:53 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: joseph@telaak.dev
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] usb: dwc2: Add Siflower SF19A2890 support
Message-ID: <2026112039-library-rise-d0b7@gregkh>
References: <20261111-sf19a2890-dwc2-v2-0-cba9dd4a4256@telaak.dev>
 <20261111-sf19a2890-dwc2-v2-2-cba9dd4a4256@telaak.dev>
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
In-Reply-To: <20261111-sf19a2890-dwc2-v2-2-cba9dd4a4256@telaak.dev>

On Wed, Nov 11, 2026 at 03:26:02AM -0500, Joseph Telaak via B4 Relay wrote:
> From: Chuanhong Guo <gch981213@gmail.com>
> 
> The Siflower SF19A2890 has a DWC OTG 3.30a controller. Limit its
> transfers to 65535 bytes and its AHB bursts to INCR4, the settings the
> OpenWrt port has run it with.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> [Joseph Telaak:
>   - take it from OpenWrt's siflower target and rebase on v7.4-rc1
>   - commit message and subject]
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>
> ---
>  drivers/usb/dwc2/params.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)

When you don't cc: the dwc2 maintainer, you'll not get a review...
