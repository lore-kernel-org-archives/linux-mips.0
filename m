Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793912462;
	b=Oxsn2xPHfXn+QSUdIUy5SV0Trwz8hibANkjm8VGdxnX7XEKfxKJQko7ptwJh76jB9nz1
	 59t2g+DadoPRDpvcWOtzTmKgUgfyGLA0Eb/SQC5hLQAnAsbIWvPNjyYti1JFpv0T6+sTs
	 MOKgtkwW1Gs2rp7jCltS1FgM7FQrMmLMFlMLSc81NW0pxS4BjWA0sQ3augi53SpGlsiFF
	 AcLhcleRPD0GHrEaJhGrxwK0BsMwedD3U0snAbitPtdnYyDgOme8uOIfRE1iMrRmBZR7Q
	 6EvDmsoOmSq5NBA5xKmU5VXLMrMqIV0GYuiS8LM76PylFaDysbHIQDXIKeNr1pwojiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912462;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=7b+CfX8248YTc0cB7f90DTUeLWviHqXuubKAwrMY9UM=;
	b=st+B5tRq8RqQtQ7D9I0SOzHAETchFmGVBAHKmRuloXqmWAcJ3SAR2pNWElwf31MmvQMl
	 iKUnDKnJ+3vZjQ4pwpLdnEkZFQ1wLwmXRgAg/aOSyoStGQ/Fp7wQn42l3Sj7R9AIP4FyT
	 VmX0XuyCSVtOUxVBn61hDmstBrTdTQjNaqT7+7df8Zu04MQHnIy/DScIjTwqhSTdFvd86
	 AadydysGbKoDcNXwSwmXXIZG3k6Q4S1TvmG0rP5cYdFLFbJbQgf6agRRsuFCtyRyLf796
	 EXp1JKhyiSMeCkQk7SPFNY680MwfMzIYJDp6g1q3vYeBdZWWsn38AgJsXjHgX+ZNQtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF26B606A32D
	for <linux-mips@vger.kernel.org>; Thu,  5 Nov 2026 21:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF26B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ed3d8877e6so2772425ad.3
        for <linux-mips@vger.kernel.org>; Thu, 05 Nov 2026 13:01:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912461; x=1794517261;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7b+CfX8248YTc0cB7f90DTUeLWviHqXuubKAwrMY9UM=;
        b=R4JfsZfXdsaVwW3UHqpS/y8WNeMXKQ0MmmS2wKitndMWlMFp/QAQ/IDVvNG/6m4g6E
         n60S8e/EwPXgc61iKFnLfvMuR3QbMeUi+voldujSjl4u1gc7D3su9AHzbvXKm21dWpNG
         5RxkAVgn3XOnfHMN0RpDlXQE5Ukmf4Z1XWxKgXOsclE3eFOg36sTgdgAU7t4axG9KcGT
         A3pJy9cpR6/xV9+4x4CK2+f4UK7KW9vAMB7orrFZlq+eFSVpvd9aspWmjB6pzN9v2CoT
         wfB3IUaa7L73zdivBYDszIlcF8vUN917AfZYRLOEKiUvAR4+zKNiwR+hjNYfHdz10fem
         HjIg==
X-Forwarded-Encrypted: i=1; AKwUvBxgu1cZsMu9ON3IvU4bHHZu5E/iFQszNAGWJW9WIfSLrfVfSIETtZdme5EE1+0Z6oqEBB4uVRbeUR/B@vger.kernel.org
X-Gm-Message-State: APuU4Z+GuHGgDeeQEHRQYd0kY3xy5KXqwyqO8Hi9B7AeTS8Y93PfYv7I
	SFLUKYtjXzAGcV83XDLZpGZnlJ7RAZ51+RMQn+2Djl3Gl3s9wxaeS2BKMtoPSiOx
X-Gm-Gg: AYBFou2Aw1FCXd6zKgnpFAcn5H3FwNQdBfm8xKERZbrb8usS7iwZb98lUj2VJhOvCkr
	BjG/Hj4hMFy2aQ8zoaLDLWClHHY/XQvxZouJR1k8cYGuXVgSVuCoVYW3szkgzi2mhHI0iRojfRg
	H+00e/R2tsavG7vF0TIV04ntS46ESAldvUdRklrstZbQVzlpfdQz0y2yVPTwoQ9UFM4Knr1O8ft
	Z4Z4pXYWwM4vVv8Qr2mQsTPEfRAiyQWb8ga9qXGa0czARxg8BRmZys1iH5hzl9ENrQP12Yamx4Y
	6DEmBvj03UF/b/q1+UK6LGzpPhEYZ9rRlyakMUYfxzmtmOUIv57A0DDgZNukcWulxGj1MKUbnzy
	VdFVapkiVfQJ2OQdVfFuHd1C+r7ip+ARRnWqPLyI6smhR4kS+katsjgZyg4AnaWLawVtPQF1Nf0
	zYFwoyds0CPmSfohM8aWOKp0QN0a7UqETNFvIqaevnp1zcezj3e98iYgjZFFm4qjSJEUlUSsHZa
	O1Ux1nvcXTndImOQenCFf7Yono+KAPtp7CTOmxZ1/u/HgAJdo5Kfe5y2lMILuITp9+sEdL7kfl1
	nVL9mt2dqQ9UcpXaSjBkWwYPqEz0n63+oSWWtb3K78xJhYFWvF7crp8FvtmpVVHzi2PQo4oSCCC
	P2SeZAaYSuqgoI3qwB0WCwjQdsY8FA7RNbD1MlFu/uLE=
X-Received: by 2002:a17:90b:17c8:b0:3b0:9e2c:9b57 with SMTP id 98e67ed59e1d1-3b0db605b27mr220727a91.4.1793912461108;
        Thu, 05 Nov 2026 13:01:01 -0800 (PST)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com. [74.125.82.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b32baf86sm5015899a91.17.2026.11.05.13.00.59
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:01:00 -0800 (PST)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3282db206d3so156956eec.0
        for <linux-mips@vger.kernel.org>; Thu, 05 Nov 2026 13:00:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByRD8jGg/3XqPDnGERfGVeQQL4zaWHrl2C12WK2s/gLyc4bUBylfBNqNdOiZF85rfj2IyXeMvfSHID3@vger.kernel.org
X-Received: by 2002:a05:7301:7187:b0:36f:4569:7392 with SMTP id
 5a478bee46e88-36f77103af4mr423739eec.41.1793912459132; Thu, 05 Nov 2026
 13:00:59 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-usb-phy-v1-0-db0cad937614@telaak.dev>
 <20261104-sf19a2890-usb-phy-v1-2-db0cad937614@telaak.dev> <7905740841dd0f47273b63dd28ee504b6fdf8084.camel@pengutronix.de>
In-Reply-To: <7905740841dd0f47273b63dd28ee504b6fdf8084.camel@pengutronix.de>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 5 Nov 2026 16:00:47 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ5kwLxQZCRF9+ywSavP0G3K0ytvB5+NbmrWGrtLbOnw=Q@mail.gmail.com>
X-Gm-Features: AclHuK9lRGyMU734A3a1_3WSwAPLqlbO5flD8SV-l9TZ_P6sYsnX4mVcOu8Aedc
Message-ID: <CAPY4CJ5kwLxQZCRF9+ywSavP0G3K0ytvB5+NbmrWGrtLbOnw=Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] phy: siflower: Add SF19A2890 USB 2.0 PHY driver
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Since these two resets are always toggled together, consider using the
> reset_control_bulk API for both.

Thanks, v2 will get and toggle both with the reset_control_bulk API.
