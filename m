Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433ED3A255F;
	Wed, 16 Sep 2026 12:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560548; cv=none; b=dbnNfbhkj/znBeL2/LifOo3fg2DPmMCOeit6x3t3bS4sA6jC1VtIcMETLF/LCNp/eHRBhyCvzcrU8qRJlY3xoEuhAlgdqBkwjufq8RV1Pwv1ZwPyfkWGpWE273BWouaVqE74SJBRUzj0gsJgozF+/RDiEauScimGVlxh3WIdZNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560548; c=relaxed/simple;
	bh=d+riWkzY7q0D6HM2ci+jcWpLhyoHJWVEnRYlfZf/RNY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rK3IcuLdCRqtwUcuqSCZYkWNy1y+KIic1YkpIHNtkMs0Nmpf/3hZkzl6qfwUPLquhOvbeH6TerA7xwpRgYCBAgwYMSL7gBWgl8J5SZrPS1y5RBiDhZHLEx2zTCNitrvPwL175CuBP2EQgt1pfPmgJW4xIyA7DJMdsUJerAaji+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UInVsfQ6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UInVsfQ6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD1C1F000FF;
	Wed, 16 Sep 2026 12:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789560539;
	bh=HSYim5Wxi1PvEp4JVMuAVhAZ3OFAwfBLwHxEX4lM0DY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=UInVsfQ6krE0FNJY5UUARa6DiUpRAySntdgO4ZVZj5o2/6rWF9kh5/JFk5VKetz+6
	 nufkt9N7nc6DcjrICjgjPGDG8ba4gMzLDQtpOk30asoDM/0F0KGup5nOO8dGmPGfd9
	 zJdaqUZr/S8dIqdLk/95Gtio+yOo9pKnSfF5nBy7n0JBNKD5CRgDcea0jpgJDDyLBe
	 7+zQGGvl4Y/2cszG5lGr1lyVennQcglpeTyZj70igNO4+560odvmqd5xdEQZxm9/yG
	 MWKavfwzoLfy8rbBnxVZN+HIG9YTrhcttbL4A7QvYQ67s7/+aKdrQf2WgaJeAxHBJV
	 u5CFDyVM1dceQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Baojun Xu <baojun.xu@ti.com>, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
 Cyril Chao <cyril.chao@mediatek.com>, Darren Ye <darren.ye@mediatek.com>, 
 David Rhodes <david.rhodes@cirrus.com>, Kevin Lu <kevin-lu@ti.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-sound@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 patches@opensource.cirrus.com, Paul Cercueil <paul@crapouillou.net>, 
 Jaroslav Kysela <perex@perex.cz>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, Sen Wang <sen@ti.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20260828113416.47061-1-pengpeng@iscas.ac.cn>
References: <20260828113416.47061-1-pengpeng@iscas.ac.cn>
Subject: Re: (subset) [PATCH 00/20] ASoC: propagate register restore
 failures
Message-Id: <178949144504.151760.12464142695639435377.b4-ty@b4>
Date: Tue, 15 Sep 2026 17:57:25 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3614; i=broonie@kernel.org;
 h=from:subject:message-id; bh=d+riWkzY7q0D6HM2ci+jcWpLhyoHJWVEnRYlfZf/RNY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqqobUqaQMsTSfvXw5SOzhPOjjf49lajDtxY70q
 bjt1LzvU2eJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqqG1AAKCRAk1otyXVSH
 0JwAB/4qX2VCeUFhY26zn+oKpD/Z2FRkfF5QuhC418CZ9p4F5gLsSZJzpAqnUeSLWh6eX73u3xL
 zzsmCliChrB4KPQ6kn0A02V87HZxC2LIuwi8D5GXPjtiqiujVztKUdAjTdkCA8/L8S/UUSofek6
 U+nFLSsGhKyGlYM09dbKt3u7sAWDD+znHNxYoAp2V5rJOp8WJnY56qzDR6dblNGSsJVzBlQqU6P
 kzI1glDOfv5zqLcz8/4BKkbU5Pz7UzgiJqBzfS02j+MSAvAnT3UqdfAYrszSKUz7wWLIFEs8nlh
 NN0+KQHdQrXdlQh8mHDeBrlCKSKrcbjmYO96Rey1XEGJslbI
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 28 Aug 2026 19:33:55 +0800, Pengpeng Hou wrote:
> ASoC: propagate register restore failures
> 
> Several ASoC codec and AFE power transitions restore cached register state
> after reset or power loss.  The callbacks in this series all have an effective
> error consumer: component probe or hw_params, DAPM bias handling, device
> runtime PM, or system PM.  They currently continue or publish success after a
> required register operation failed.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[01/20] ASoC: adau1372: Unwind failed power restoration
        https://git.kernel.org/broonie/sound/c/affb75ebf9ae
[02/20] ASoC: adau1701: Propagate register cache replay errors
        https://git.kernel.org/broonie/sound/c/6194ceba5dac
[03/20] ASoC: cs35l56: Propagate register restore errors from runtime resume
        https://git.kernel.org/broonie/sound/c/adf7e9a1f508
[04/20] ASoC: cs42l42: Propagate system resume restore errors
        https://git.kernel.org/broonie/sound/c/68cbe8933835
[05/20] ASoC: es9356: Publish IRQ readiness after cache replay
        https://git.kernel.org/broonie/sound/c/31a717842535
[06/20] ASoC: jz4740: Propagate codec wake-up errors
        https://git.kernel.org/broonie/sound/c/c826c897a330
[07/20] ASoC: max98088: Propagate cache replay errors from bias restore
        https://git.kernel.org/broonie/sound/c/11e145401b68
[08/20] ASoC: ssm2518: Unwind failed power restoration
        https://git.kernel.org/broonie/sound/c/6b4330d590a2
[09/20] ASoC: ssm4567: Unwind failed power restoration
        https://git.kernel.org/broonie/sound/c/4406319f7f52
[10/20] ASoC: tlv320aic3x: Propagate power restoration errors
        https://git.kernel.org/broonie/sound/c/1621a23dd164
[11/20] ASoC: wm8731: Unwind supplies on cache replay failure
        https://git.kernel.org/broonie/sound/c/f7c28c42085b
[12/20] ASoC: wm8770: Unwind supplies on cache replay failure
        https://git.kernel.org/broonie/sound/c/fcfcb17039d9
[13/20] ASoC: wm8804: Propagate cache replay errors from runtime resume
        https://git.kernel.org/broonie/sound/c/a4de439e78dc
[14/20] ASoC: wm8904: Unwind resources on cache replay failure
        https://git.kernel.org/broonie/sound/c/4da4cb28883d
[15/20] ASoC: wm8985: Unwind supplies on cache replay failure
        https://git.kernel.org/broonie/sound/c/76f9631fa81b
[16/20] ASoC: wm8991: Propagate cache replay errors from bias restore
        https://git.kernel.org/broonie/sound/c/745f64b9335b
[17/20] ASoC: wm8993: Unwind supplies on cache replay failure
        https://git.kernel.org/broonie/sound/c/7784ba385367
[18/20] ASoC: wm8996: Unwind supplies on cache replay failure
        https://git.kernel.org/broonie/sound/c/8fe60034e163

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

