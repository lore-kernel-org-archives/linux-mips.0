Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793531241;
	b=Fg4ObzIt9vbpOKnRF0vZu62YNeyPq+hjYFaKQqcii0JW7D7M7JpXY8KxY93x+IeAeHvf
	 ufanZOz7njmaBhIwfbfBKCAJK6bTAfk4BrfJBAHGS3HzbYyPYtU/sodeUPYc51Qb4881+
	 iLFTHZJTwkDaVl/B+iwSt47ok0Gjh2+8YfIyKE3gTeCwHuwldpuqNS5/Q+1UNWwyzhiI8
	 h8QEbxZ7LkZDY2HSt0renwbWbnq6Iap6WS68Dojok2LfB5HZYXQrODfVM2M05egwwDQNe
	 vkF8EINdNntdHowAsNNgT9YaaMkL4g0XiOM5lDe3nwW/9j+hXxEhVFvuvCoWeHAP/Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793531241;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=hlNY/PV8DGVOaVDQ87qnWmiDTqBZhpUgMHIAxp3ZzvA=;
	b=kDV0yax5owKij1hQk9q2bckEk6oKah6Y/a1B4/hV6SJSDihYvziLwZe9e/7CCBJphwM3
	 9gGZFnYcIhWZ1J2BwAYgXQDMM2SZNsuk2g30iLIqCxb5mMNhAjoaesuBShs1dENCVRgwo
	 aHXF0av7pYaFOznNf7SEjw/IVcRElNCEsSI9CfWhh+np4FkxdbViG0XIm4OfmcIdjm6i9
	 oDlNhQXdOHW7PU+/TCcR5jEy/wtXx9dWrMk8DcsqZ9FFmpTop2sA1AZsoQDS0MZkrgdO8
	 8IScwDSXR1N95vXBAvErC/fz52+SQfAsacJeQZwGekK252jKyfniVy6tlwg746DT3dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e+qDYpEv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820D9606A324;
	Sun,  1 Nov 2026 11:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e+qDYpEv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 017741F000C1;
	Sun,  1 Nov 2026 11:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793531241;
	bh=hlNY/PV8DGVOaVDQ87qnWmiDTqBZhpUgMHIAxp3ZzvA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=e+qDYpEvupV2f4QI+ABCnWxY7QIYk/8tszNFxOaWNecB5AM34b8uv2iIq4abolxIM
	 BpL8WabsJF7IFYUW+iD14mWdApn1fy4w6+sn7437wyjCjZEFMCzJDolzQuEnxy7ZLr
	 N7Dbgr6ny5HsgGN8285AkM0x58KVd8NVhmiH4YuQr4aEyhStF520jaBogDpUX6kCUR
	 mjiykSaF1mWYN43WOol+ROXLJyflx9TgHUOd4tVJDrS+7Rlg99KaygWyn51UHPFdq+
	 xJ7/fqqcsjA3pIAV3Bp5WshWmbdslIV4l2ll6XqxdO4l2NmYbVSwtNFrIa5e/xa3a4
	 w5OX2w8X+l7DQ==
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] phy: ingenic: Don't disable the supply in exit
From: Manivannan Sadhasivam <mani@kernel.org>
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Paul Cercueil <paul@crapouillou.net>, linux-phy@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261024051756.79342-1-olivier@mgcrea.io>
References: <20261024051756.79342-1-olivier@mgcrea.io>
Date: Sun, 01 Nov 2026 16:37:16 +0530
Message-Id: <179353123621.2955.1763925677067862965.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=640; i=mani@kernel.org;
 h=from:subject:message-id; bh=/AyMrrTg8Y397zc3NTnyqQqqDGUCh56bFnIUP/Ey9GQ=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5x1mQ+/vqLmjlLlj7D/J+HKB89tHLr4pP2XBo
 tc2ISXp6MKJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaucdZgAKCRBVnxHm/pHO
 9Xw1B/9ieynVZm2Z2sQAMUegzCNku6ctqgBumbhH6y9X0wsbZVMD/qiu3Jywa/jY/iPnJTl5dA9
 wWX0vuIRwDwJhQnYmnht7GMj29L/944OvD1zCrIJkQOjp66r0TyA9ZFI8PiZMN33sRIHmvlo5Pi
 bgEB7RpUJpCpDBD3wvvMU+U6JR8EIeEvpJaWmlWUOlQ9l/CZeOgVYW9VDfWt9M+MXaGVbvGT6Hn
 0xDqpj8+iH1rSV48wjE96QCh4Xt+T21veUGZuAqazHMjhvTPvPyVgzXt47B3A/upAqCD8tzi7x5
 A7V8QT5SgegqoUHECrrqt7Y9yKfS7ET2dI0cbymQyt3Kfpts
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-24 07:17 +0200, Olivier Louvignes wrote:
> The supply is enabled in power_on() and disabled in power_off(); exit()
> disabling it again unbalances it. dwc2 powers its PHY off before exiting
> it, which warns at every probe on an Ingenic X1600:
> 
>   WARNING: ... _regulator_disable
>   ...
>   ingenic_usb_phy_exit
>   phy_exit
>   dwc2_lowlevel_hw_disable
>   dwc2_driver_probe
> 
> Fixes: 31de313dfdcf ("PHY: Ingenic: Add USB PHY driver using generic PHY framework.")
> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


