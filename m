Received: from heliosphere.sirena.org.uk ([IPv6:2a01:7e01::f03c:91ff:fed4:a3b6]:50902
        "EHLO heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992153AbeGRM3y3th1y (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 18 Jul 2018 14:29:54 +0200
From: Mark Brown <broonie@kernel.org>
Subject: Applied "spi: dw: allow providing own set_cs callback" to the spi tree
In-Reply-To: <20180717142314.32337-3-alexandre.belloni@bootlin.com>
Message-ID: <E1fflaY-0007Wj-SM@debutante>
Date: Wed, 18 Jul 2018 13:29:50 +0100
Return-Path: <broonie@sirena.org.uk>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>Mark Brown <broonie@kernel.org>, James Hogan <jhogan@kernel.org>, Paul Burton <paul.burton@mips.com>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Allan Nielsen <allan.nielsen@microsemi.com>linux-spi@vger.kernel.org
Message-ID: <20180718122950.ILwYTiUiCthIcbEG9naHju8tYUzKVyVa2p2RuoJdgJ4@z>

The patch

   spi: dw: allow providing own set_cs callback

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git 

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
