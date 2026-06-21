-- print("hello from fredcollman")

-- 1. ensure leader is set (used by subsequent mappings)
require("fredcollman.set")
-- 2. basic shortcuts and commands for native features (plugin-free)
require("fredcollman.remap")
require("fredcollman.autocmd")
-- 3. install lazy and run its plugins
require("fredcollman.lazy")
-- require("fredcollman.treesitter")
-- 4. install packer and run its plugins
-- (temporary, while migrating to lazy)
-- require("fredcollman.packer")

-- print("fredcollman done")
