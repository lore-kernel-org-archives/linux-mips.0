Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7240447808;
	Fri, 28 Aug 2026 11:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787916884; cv=none; b=pbMmbWwePJRHP5dmPpOOxMelymQt8qGIHRVQ6s6q3ZntpHqzo+Ak4aaHiJKybL6CZs+xDWb0bVHLg7SFMxoxV53TSqS8D3/IQbyTvVqOWZscMuLwQOwqIvNLaP8oLdCL2RcMBI1u2yx35SUhG2QyaD3bqPLbAiwV7jzcQAqEPkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787916884; c=relaxed/simple;
	bh=azgkEnhCbo+4BzTSIGtAyYr42f35MGGM/su8qnxbyQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hq0fYi5CUeVFR/g54HtWUIgQNvJMVYZMXcVmw6nKLMQXXOCitzqe1PRk1NNkBAYUwQKCZ53sXl6HCaU4vYIMaTv/sdhjUkXrJVyWJ5nQtJWzwlBp0U5MEP68bAJgcZOICaacNPxlrdmk1V4IbwEE4/1cX8c5yKCAEoZNN1/i2jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowACnfPA6cpFqpPm9Bg--.43118S2;
	Fri, 28 Aug 2026 19:34:18 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Baojun Xu <baojun.xu@ti.com>,
	=?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>,
	Cyril Chao <cyril.chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	patches@opensource.cirrus.com,
	Paul Cercueil <paul@crapouillou.net>,
	Jaroslav Kysela <perex@perex.cz>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Sen Wang <sen@ti.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 00/20] ASoC: propagate register restore failures
Date: Fri, 28 Aug 2026 19:33:55 +0800
Message-ID: <20260828113416.47061-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACnfPA6cpFqpPm9Bg--.43118S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXw13Cry8Xr13GrW8tr4kCrg_yoW5Kw4fpr
	s3G39Yqw1rX3y3Zw4fA3yUX3Zaka4ruF45JwnFq34vyry5CF1xKr4Iyw1UZFWUXrykKa9x
	Xr13A3yDCr15JaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIda
	VFxhVjvjDU0xZFpf9x0pRx-BiUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

Several ASoC codec and AFE power transitions restore cached register state
after reset or power loss.  The callbacks in this series all have an effective
error consumer: component probe or hw_params, DAPM bias handling, device
runtime PM, or system PM.  They currently continue or publish success after a
required register operation failed.

Check the complete local restore transaction at each site and unwind clocks,
supplies, GPIOs, cache state or software publication where that transaction
acquired them.  For the Mediatek AFE drivers this also makes the clock helpers
unwind partial internal acquisition prefixes before returning to runtime PM.

This is a new set of sites, not a revision of the earlier 19-patch series at:

  https://lore.kernel.org/all/20260704034845.14291-1-pengpeng@iscas.ac.cn/

It intentionally excludes snd_soc_component_driver resume callbacks whose
return values are discarded by snd_soc_component_resume(); that shared policy
is being discussed separately.  The cs42l42 patch covers the shared system
resume helper and is distinct from the SoundWire runtime-resume path fixed by
commit a118fea777a2.

The issues were identified via static analysis and manually reviewed.

Assisted-by: LLM

Pengpeng Hou (20):
  ASoC: adau1372: Unwind failed power restoration
  ASoC: adau1701: Propagate register cache replay errors
  ASoC: cs35l56: Propagate register restore errors from runtime resume
  ASoC: cs42l42: Propagate system resume restore errors
  ASoC: es9356: Publish IRQ readiness after cache replay
  ASoC: jz4740: Propagate codec wake-up errors
  ASoC: max98088: Propagate cache replay errors from bias restore
  ASoC: ssm2518: Unwind failed power restoration
  ASoC: ssm4567: Unwind failed power restoration
  ASoC: tlv320aic3x: Propagate power restoration errors
  ASoC: wm8731: Unwind supplies on cache replay failure
  ASoC: wm8770: Unwind supplies on cache replay failure
  ASoC: wm8804: Propagate cache replay errors from runtime resume
  ASoC: wm8904: Unwind resources on cache replay failure
  ASoC: wm8985: Unwind supplies on cache replay failure
  ASoC: wm8991: Propagate cache replay errors from bias restore
  ASoC: wm8993: Unwind supplies on cache replay failure
  ASoC: wm8996: Unwind supplies on cache replay failure
  ASoC: mediatek: mt8186: Unwind runtime resume failures
  ASoC: mediatek: mt8196: Unwind register clock and cache restore
    failures

 sound/soc/codecs/adau1372.c                | 44 ++++++++++++++--------
 sound/soc/codecs/adau1701.c                |  4 +-
 sound/soc/codecs/cs35l56-shared.c          |  9 ++++-
 sound/soc/codecs/cs42l42-sdw.c             |  4 +-
 sound/soc/codecs/cs42l42.c                 | 27 +++++++++----
 sound/soc/codecs/cs42l42.h                 |  2 +-
 sound/soc/codecs/es9356.c                  | 14 +++++--
 sound/soc/codecs/jz4740.c                  | 25 ++++++++----
 sound/soc/codecs/max98088.c                |  9 ++++-
 sound/soc/codecs/ssm2518.c                 | 15 +++++++-
 sound/soc/codecs/ssm4567.c                 | 15 +++++++-
 sound/soc/codecs/tlv320aic3x.c             | 36 ++++++++++++++----
 sound/soc/codecs/wm8731.c                  |  7 +++-
 sound/soc/codecs/wm8770.c                  |  7 +++-
 sound/soc/codecs/wm8804.c                  |  6 ++-
 sound/soc/codecs/wm8904.c                  | 10 ++++-
 sound/soc/codecs/wm8985.c                  |  7 +++-
 sound/soc/codecs/wm8991.c                  |  7 +++-
 sound/soc/codecs/wm8993.c                  |  9 ++++-
 sound/soc/codecs/wm8996.c                  | 11 +++++-
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c |  2 +
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c | 15 +++++++-
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 27 ++++++++++---
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c |  8 +++-
 24 files changed, 251 insertions(+), 69 deletions(-)

-- 
2.43.0

