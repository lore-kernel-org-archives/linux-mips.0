Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623297;
	b=QZDsEsFqLNkZJSCbGQtUVVZJSwizBhe/2NuWgNx9GY8MAt2re3Tx36GDIE5CQQM9/bAo
	 xwEiEB+J9/nKsnw5YyMrhVFYRoiWyWyA1EOy8DzolXTR2VcODTwRzbh8SvyVT+fNiexz5
	 3kGuXABDODXhJssHa4JCJRnL2hkQTukfxowkRmJtVc/FPyP1Z0stiTno80ln0LtnIAkp/
	 4exXXQC6f5K0JE7Uy7I5QXy9SGCYyvURyXdtNW35PCzmWYJY69u5xuan0LYIwfreczkZI
	 hnEVopnk40mETa0pjCrbkYEqq76EtNozDEhzH7U+d83tQ51woZTSnnlh1wo3pH9uSGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623297;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=/ctRInFLIXM8Zr3UG7MbiXc1PIk/A2Vn0/3BPZ0Lpqo=;
	b=KZykSY2Fgg/o0zn7+7Ta35fKcvUZQB8UwPXgrmJPK7OrQC7foCPF8ZwbhHXicAzheCOm
	 3eV3swObp6AUtjxDwcYiC+97be94okixd5/G8/pMEqHw5lYruVm3nsJk+xUgCCDn/hM8K
	 jS01XNJDk5zrPR+1WcuU22FPlGlGFPUBBEfiXS3DWR1HinPaetKlV5ATpwOllJ20TjsZo
	 ucqnheaDH1q2Lygd9epky8bfwbxgsTjgxK6Mi0aY31/8cr/va74KgaDmiYHTMn0faK22a
	 fINQQq7pE9iqT18uID6H9C5UsyyMNQirU/FnSNwmaqx+vpC/9swyaJV1zvxpcGQY6EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Ow/lmMas";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B905606A33A;
	Mon,  2 Nov 2026 12:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ow/lmMas
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B53FC1F00A16;
	Mon,  2 Nov 2026 12:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793623296;
	bh=/ctRInFLIXM8Zr3UG7MbiXc1PIk/A2Vn0/3BPZ0Lpqo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Ow/lmMashqonWLQc6FSl7bUZJZOZt0tAbwhoY+idh6Y0EGFBRa3GmLrUTi4xg03c7
	 RS0HRijW/viK6wvskhxFFZZhsMn0MQ2RGTwbRW7YW9jDtDzwDNnZjE1soUz6LDdhkg
	 zeyAYo+NF5/nDvi1GxAIDn9cPeNGAUxeQ/SElzHEVCDaBpYLUFPf9YYh5ynACKqew8
	 bBKJGAixjHw0qQYRXsU5sWMw9ZawV+P1G76taYeCHP6m2DA9j17T0S/dt1s1fKPrhd
	 jph05npTy2JtSbotkgzplsGgb5q40T6YgsVKLfDoix0hJuZIFnMzHSz6h3wdiCTBAb
	 YKShdjhZxNV7g==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 006CA23103C5;
	Mon, 02 Nov 2026 12:41:35 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "H . Nikolaus Schaller" <hns@goldelico.com>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-mips@vger.kernel.org
In-Reply-To: <20261024214438.33342-1-olivier@mgcrea.io>
References: <20261024214438.33342-1-olivier@mgcrea.io>
Subject: Re: [PATCH v3 0/2] ASoC: jz4740-i2s: Add the X1600
Message-Id: <179357847400.1716893.15741515093171614557.b4-ty@b4>
Date: Mon, 02 Nov 2026 00:14:34 +0000
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
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1916; i=broonie@kernel.org;
 h=from:subject:message-id; bh=SV4jhlUiBxMInjzzpsP03roHQSvpTpye4nevuuAn7d4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJetPzrrLxUKqKXbrhRtOJ9mLv9Is2/6tfW6KlFnsvg6
 PXj007vKGVhEONikBVTZInL4n5ZX/J6Dd/BhW0wc1iZQIYwcHEKwET+bWL4w8ekeG/fl/ojbyOi
 85SrepJXTRfqiOaUn+rREdqWWht9jJFhfqrhEiPV9xWLTjm9SxHvUt9R1h+961n1ukrp1a/Vn/9
 jBAA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 24 Oct 2026 23:44:36 +0200, Olivier Louvignes wrote:
> ASoC: jz4740-i2s: Add the X1600
> 
> The X1600's AIC differs from the X1000's in its bit clock divider (the
> divider itself, even values only) and in how it plays mono (a channel
> count in AICCR, no MONO_TO_STEREO). Tested on a HiBy R1.
> 
> Changes since v2:
> - The channel field is bits 26:24, not 27:24 (bit 27 is reserved), as
>   Nikolaus pointed out from the X1600 programming manual.
> - Don't set MONO_TO_STEREO on the X1600: bit 11 is reserved there.
>   Listened to on the R1, a mono stream sounds the same with it set or
>   clear, held clear from before the stream starts included.
> - Commit messages say what the manual says, and the X1000 is left as
>   it is.
> - Rebased on broonie/for-next.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: dt-bindings: ingenic,aic: Add the X1600
      https://git.kernel.org/broonie/sound/c/c9b80010a8af
[2/2] ASoC: jz4740-i2s: Add support for the X1600
      https://git.kernel.org/broonie/sound/c/318260c84945

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

