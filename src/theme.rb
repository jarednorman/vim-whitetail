class Theme
  def each_syntax_element
    elements.each do |name|
      yield name, "NONE", "#000000", "NONE"
    end
  end

  private

  def elements
    %w[
      ColorColumn Comment Conceal Constant Cursor CursorColumn CursorIM CursorLine
      CursorLineNr DiffAdd DiffChange DiffDelete DiffText Directory EndOfBuffer
      Error ErrorMsg FoldColumn Folded Identifier Ignore IncSearch LineNr
      MatchParen ModeMsg MoreMsg NonText Normal Number Pmenu PmenuSbar PmenuSel
      PmenuThumb PreProc Question QuickFixLine Search SignColumn Special SpecialKey
      SpellBad SpellCap SpellLocal SpellRare Statement StatusLine StatusLineNC
      StatusLineTerm StatusLineTermNC String TabLine TabLineFill TabLineSel
      Terminal Title Todo ToolbarButton ToolbarLine Type Underlined VertSplit
      Visual VisualNOS WarningMsg WildMenu debugBreakpoint debugPC helpLeadBlank
      helpNormal
    ]
  end
end
